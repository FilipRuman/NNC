pub mod args;
pub mod config;
pub mod create;
pub mod date;
pub mod file_display;
pub mod file_parsing;
pub mod help;
pub mod show;
use std::fs::{self};

use anyhow::{Context, Result};
use log::error;

use crate::file_parsing::ParsedFile;

fn main() {
    colog::init();
    match main_result() {
        Ok(()) => {}
        Err(err) => error!("{err:?}"),
    };
}
fn main_result() -> Result<()> {
    let parsed_args = args::parse_args()
        .context("Encountered an error while parsing the command line arguments!")?;
    let parsed_config = config::parse_config().context("parse config")?;
    match parsed_args.command_type {
        args::CommandType::Show => {
            let on_open = if parsed_args.open {
                Some(|file: &ParsedFile, parsed_config: &config::Config| {
                    parsed_config.open_path(&file.path)
                })
            } else {
                None
            };

            show::show_and_open_files(parsed_args, parsed_config, on_open)
                .context("handle show command")?;
        }
        args::CommandType::Create => create::create_file_form_args(parsed_args, parsed_config)
            .context("create a new file")?,
        args::CommandType::Help => help::display_help().context("display help command")?,
        args::CommandType::Done => todo!(),
        args::CommandType::Remove => {
            let on_open = Some(|file: &ParsedFile, _: &config::Config| {
                fs::remove_file(file.path.clone()).expect("removing file did not succeed");
            });
            show::show_and_open_files(parsed_args, parsed_config, on_open)
                .context("handle remove command")?;
        }
    };
    Ok(())
}
