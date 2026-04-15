use std::env;

use anyhow::{Context, Result, bail};
use time::Date;

use crate::date;
pub enum CommandType {
    Show,
    Create,
    Help,
    Done,
    Remove,
}
impl From<String> for CommandType {
    fn from(value: String) -> Self {
        match value.as_str() {
            "show" | "Show" => CommandType::Show,
            "help" | "Help" => CommandType::Help,
            "create" | "Create" => CommandType::Create,
            "done" | "Done" => CommandType::Done,
            "remove" | "Remove" => CommandType::Remove,
            _ => CommandType::Help,
        }
    }
}
pub struct ParsedArgs {
    pub command_type: CommandType,
    pub priority: Option<u32>,
    pub contents: Option<String>,
    pub title: Option<String>,
    pub labels: Option<String>,
    pub date: Option<Date>,
    pub open: bool,
    pub path: Option<String>,
}
pub fn parse_args() -> Result<ParsedArgs> {
    let mut args = env::args();
    // Skip the first argument which is the executable path
    args.next();
    let command_type = match args.next() {
        None => CommandType::Help,
        Some(str) => str.into(),
    };

    let mut output = ParsedArgs {
        command_type: command_type,
        priority: None,
        contents: None,
        title: None,
        labels: None,
        date: None,
        path: None,
        open: false,
    };
    let mut command_type = String::new();
    for arg in args {
        if arg.starts_with('-') {
            if arg == "-o" || arg == "--open" {
                output.open = true;
            } else {
                command_type = arg;
            }
        } else {
            match command_type.as_str() {
                "-d" | "--date" => {
                    output.date = Some(date::parse_date(&arg).with_context(|| {
                        format!("Date supplied in arguments is invalid: '{arg}'")
                    })?)
                }
                "-t" | "--title" => output.title = Some(arg),
                "-c" | "--contents" => output.contents = Some(arg),
                "-l" | "--labels" => output.labels = Some(arg),
                "-p" | "--path" => output.path = Some(arg),
                "-i" | "--priority" => {
                    output.priority = Some(
                        arg.parse()
                            .context("priority value wasn't a valid number")?,
                    )
                }
                _ => {
                    bail!("Command type '{command_type}' is invalid")
                }
            }
        }
    }
    Ok(output)
}
