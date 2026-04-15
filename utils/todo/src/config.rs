use anyhow::{Context, Result};
use log::warn;
use std::{
    env,
    fs::{self},
    os::unix::process::CommandExt,
    path::PathBuf,
    process,
};
#[derive(Debug, Clone)]
pub struct Config {
    pub open_command: String,
    pub base_path: String,
}
impl Config {
    pub fn open_path(&self, path: &PathBuf) {
        let _ = process::Command::new(self.open_command.to_owned())
            .arg(path.to_str().expect("Path to open wasn't a valid utf8"))
            .exec();
    }
}

pub fn get_base_dir() -> Result<PathBuf> {
    let mut path = env::current_exe()?;
    path.pop();
    loop {
        let name = path
            .file_name()
            .context("there was no file name!")?
            .to_str()
            .context("file name wasn't a valid utf8")?;
        if name == "todo" {
            return Ok(path);
        }
        path.pop();
    }
}
fn get_config_file_path() -> Result<PathBuf> {
    let mut path = get_base_dir().context("get_base_dir")?;
    path.push("config");
    Ok(path)
}
fn read_config_file_contents() -> Result<String> {
    let path = get_config_file_path()?;
    Ok(fs::read_to_string(path)?)
}
pub fn parse_config() -> Result<Config> {
    let config_contents = read_config_file_contents()?;
    let mut output = Config {
        open_command: String::new(),
        base_path: String::new(),
    };
    for line in config_contents.lines() {
        if let Some((cofnig_name, config_value)) = line.split_once('=') {
            match cofnig_name {
                "base_path" => output.base_path = config_value.to_string(),
                "open_command" => output.open_command = config_value.to_string(),
                _ => {
                    warn!(
                        "While parsing the config file{} encountered a configuration with invalid name: '{}'",
                        get_config_file_path()?.display(),
                        cofnig_name
                    )
                }
            };
        }
    }
    Ok(output)
}
