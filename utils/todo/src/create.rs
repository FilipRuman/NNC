use std::{
    fs::{self},
    path::PathBuf,
};

use anyhow::{Context, Result};
use log::info;

use crate::{args, config, date};

pub fn get_file_path(args: &args::ParsedArgs, config: &config::Config) -> PathBuf {
    let mut base_path = PathBuf::from(config.base_path.to_owned());
    if let Some(title) = &args.title {
        base_path.push(title.to_owned() + ".todo.md");
    } else if let Some(path) = &args.path {
        base_path.push(path);
    } else {
        base_path.push("default.todo.md");
    }
    base_path
}
pub fn get_file_contents(args: &args::ParsedArgs) -> Result<String> {
    let mut output = String::new();
    output += "---\n";
    if let Some(value) = &args.priority {
        output += &format!("Priority:{value}\n");
    }
    if let Some(value) = &args.title {
        output += &format!("Title:{value}\n");
    }
    if let Some(value) = &args.labels {
        output += &format!("Labels:{value}\n");
    }
    if let Some(value) = &args.date {
        output += &format!("Date:{}\n", date::date_to_str(value)?);
    }

    output += "---\n";

    if let Some(value) = &args.contents {
        output += &value;
    }
    Ok(output)
}
pub fn create_file_form_args(args: args::ParsedArgs, config: config::Config) -> Result<()> {
    let path = get_file_path(&args, &config);
    let contents = get_file_contents(&args).context("Get file contents")?;
    fs::write(path.to_owned(), contents)
        .context("Writing contents to a new file did not succeed")?;
    info!("Created file at path: {path:?}");
    if args.open {
        config.open_path(&path);
    }
    Ok(())
}
