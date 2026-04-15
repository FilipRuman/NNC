use anyhow::{Context, Result, bail};
use std::{
    fs::File,
    io::{BufRead, BufReader},
    path::PathBuf,
    u32,
};
use time::Date;

use crate::date;

#[derive(Debug)]
pub struct ParsedFile {
    pub priority: Option<u32>,
    pub contents: String,
    pub date: Option<Date>,
    pub labels: Option<String>,
    pub title: Option<String>,
    pub path: PathBuf,
}
pub fn parse_metadata(metadata_line: &str, file_data: &mut ParsedFile) -> Result<()> {
    // Typical metadata value "Title=Test title" or "Date=03.01.2025"
    let (metadata_type, metadata_value)= metadata_line.split_once(':').context("There was no ':' character in this line which is needed for metadata to declare it's value.")?;
    match metadata_type {
        "labels" | "Labels" => file_data.labels = Some(metadata_value.to_string()),
        "date" | "Date" => {
            file_data.date =
                Some(date::parse_date(metadata_value).context("Encountered while parsing date.")?)
        }
        "title" | "Title" => file_data.title = Some(metadata_value.to_string()),
        "priority" | "Priority" => {
            file_data.priority = Some(
                metadata_value
                    .parse::<u32>()
                    .context("couldn't parse the priority's value into u32")?,
            )
        }
        value => bail!("this metadata type is not supported: '{value}'"),
    }
    Ok(())
}
pub fn parse_file(file_reader: BufReader<File>, file_path: PathBuf) -> Result<ParsedFile> {
    let mut reading_metadata = false;
    let mut output = ParsedFile {
        path: file_path,
        contents: String::new(),
        labels: None,
        date: None,
        title: None,
        priority: None,
    };
    for (line_nr, line_result) in file_reader.lines().enumerate() {
        match line_result?.as_str() {
            "---" => reading_metadata = !reading_metadata,
            "" => {}
            value => {
                if reading_metadata {
                    parse_metadata(value, &mut output).with_context(||format!("Encountered an error while parsing file's metadata at path '{:?}', line nr.{line_nr}\n line contents: {value}",output.path))?
                } else {
                    output.contents += value;
                    output.contents += "\n";
                }
            }
        }
    }
    Ok(output)
}
