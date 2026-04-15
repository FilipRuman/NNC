use crate::config;
use anyhow::{Context, Result};
use std::{fs::File, io::Read};

pub fn display_help() -> Result<()> {
    let mut base_dir = config::get_base_dir().context("get base dir for the help file")?;
    base_dir.push("help.md");
    let mut file = File::open(base_dir).context("can't open the help file")?;
    let mut read_buff = String::new();
    file.read_to_string(&mut read_buff)?;
    println!("{read_buff}");
    Ok(())
}
