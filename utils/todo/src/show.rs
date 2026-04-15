use std::{
    fs::{DirEntry, File},
    io::{BufReader, stdin},
    path::PathBuf,
};

use crate::{
    args, config, file_display,
    file_parsing::{self, ParsedFile},
};
use anyhow::{Context, Result, bail};
use log::{info, warn};

fn is_file_valid(
    file: &file_parsing::ParsedFile,
    parsed_args: &args::ParsedArgs,
    name: String,
) -> bool {
    name.contains(".todo")
}

fn parse_if_file_is_valid(
    file: DirEntry,
    parsed_args: &args::ParsedArgs,
    name: String,
) -> Result<Option<file_parsing::ParsedFile>> {
    let reader = BufReader::new(File::open(file.path())?);
    let path = file.path();
    let parsed_file = file_parsing::parse_file(reader, path)?;
    let is_valid = is_file_valid(&parsed_file, parsed_args, name);

    Ok(if is_valid { Some(parsed_file) } else { None })
}

fn parse_dir_rec(
    valid_files: &mut Vec<file_parsing::ParsedFile>,
    parsed_args: &args::ParsedArgs,
    dir: PathBuf,
) -> Result<()> {
    for entry_result in dir
        .read_dir()
        .context("can't read dir while parsing a directory!")?
    {
        let entry = entry_result.context("couldn't read an entry in a parsed directory")?;
        let file_type = entry.file_type()?;
        let file_path_str = entry.path().to_str().context("")?.to_owned();
        let file_name = entry.file_name().to_str().context("")?.to_owned();
        if file_name.starts_with(".") {
            continue;
        }
        if file_type.is_dir() {
            parse_dir_rec(valid_files, parsed_args, entry.path())?;
        } else if file_type.is_symlink() {
            warn!("symlinks aren't supported")
        } else {
            let file_option = parse_if_file_is_valid(entry, parsed_args, file_name)
                .with_context(|| format!("parsing a file at path '{}'", file_path_str))?;
            if let Some(file) = file_option {
                valid_files.push(file);
            }
        }
    }
    Ok(())
}

fn get_valid_files(
    parsed_args: &args::ParsedArgs,
    parsed_config: &config::Config,
) -> Result<Vec<ParsedFile>> {
    let mut valid_files = Vec::new();
    let path = PathBuf::from(parsed_config.base_path.to_owned());

    parse_dir_rec(&mut valid_files, &parsed_args, path).context("Recursive files parsing")?;
    Ok(valid_files)
}

fn select_file_index(max_value: usize) -> Result<usize> {
    println!("Write 'i' of the file to open.");
    let mut input = String::new();
    stdin().read_line(&mut input)?;
    let parsed = input
        .trim()
        .parse()
        .with_context(|| format!("'{:?}' Input wasn't a valid number", input.trim()))?;
    if parsed > max_value {
        bail!(
            "parsed value:'{}' was greater than the total file count: '{}'",
            parsed,
            max_value
        )
    }
    Ok(parsed)
}
pub fn show_and_open_files<F>(
    args: args::ParsedArgs,
    config: config::Config,
    on_open: Option<F>,
) -> Result<()>
where
    F: Fn(&ParsedFile, &config::Config),
{
    let files = get_valid_files(&args, &config).context("get valid files")?;
    file_display::display_files_as_grid(&files);
    if let Some(open_fun) = on_open {
        let opened_file = &files[select_file_index(files.len()).context("select file index")?];
        open_fun(opened_file, &config);
    }
    Ok(())
}
