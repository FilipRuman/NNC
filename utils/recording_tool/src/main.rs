use std::{
    env::{self, args},
    fs::{self, DirBuilder, File, OpenOptions},
    io::{Read, Write},
    process::Command,
};

use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
struct Config {
    project_name: String,
}

fn project_path(config: &Config) -> String {
    let home = env::var("HOME").expect("HOME not set");
    format!("{home}/kden/{}", config.project_name)
}
fn execute_command(cmd: String) {
    println!("CMD: {cmd}");
    Command::new("bash").arg("-c").arg(cmd).spawn().unwrap();
}
const HELP: &'static str = r#"
rec-start -> start recording
rec-end -> end recording
shot-clipboard -> do a screenshot to clipboard
shot-save -> do a screenshot and open save dialog
proj "PROJECT NAME" -> set project name
manim-logo "Input .svg file path" -> creates an animation for this logo in manim 
help -> help
"#;

fn main() {
    let mut args = args();
    args.next();

    let mut config_file = {
        let mut config_path = env::current_exe().unwrap();
        config_path.pop();
        config_path.pop();
        config_path.pop();
        config_path.push("Config.toml");
        println!("config_path: {config_path:?}");
        OpenOptions::new().read(true).open(config_path).unwrap()
    };
    let mut config: Config = {
        let mut contents = String::new();
        config_file.read_to_string(&mut contents).unwrap();
        toml::from_str(&contents).unwrap()
    };
    DirBuilder::new()
        .recursive(true)
        .create(project_path(&config))
        .unwrap();

    println!("config:{config:?}");
    println!("project_path:{:?}", project_path(&config));
    let operation_name = args.next().expect(
        r#"
Operation name was not specified!
add 'help' argument to see all possible operations
"#,
    );
    match operation_name.as_str() {
        "rec-end" => {
            execute_command("pkill -f wf-recorder".to_string());
            std::process::Command::new("");
        }
        "rec-start" => execute_command(format!(
            r#"
wf-recorder -a \
  --codec=prores_ks \
  -r 30 \
  -f "{}/recording_$(date +%F_%H-%M-%S).mov"
"#,
            project_path(&config)
        )),
        "shot-save" => execute_command(format!(
            r#"
file=$(zenity --file-selection \
              --save \
              --confirm-overwrite \
              --filename="{}/Screenshot-$(date +%F-%H%M%S).png")

[ -n "$file" ] && grimblast save area "$file"
"#,
            project_path(&config)
        )),
        "shot-clipboard" => execute_command(format!("grimblast -n copy area",)),
        "proj" => {
            let mut config_file = {
                let mut config_path = env::current_exe().unwrap();
                config_path.pop();
                config_path.pop();
                config_path.pop();
                config_path.push("Config.toml");
                println!("config_path: {config_path:?}");
                OpenOptions::new()
                    .read(true)
                    .write(true)
                    .truncate(true)
                    .open(config_path)
                    .unwrap()
            };
            config.project_name = args.next().expect("expected a project name!");
            let text = toml::to_string(&config);
            config_file.write(text.unwrap().as_bytes()).unwrap();
        }
        "manim-logo" => {
            fs::copy(
                args.next().expect("expected a logo file path!"),
                "/etc/nixos/NNC/utils/manim/logo/logo.svg",
            )
            .expect("While copying the logo file:");
            execute_command(format!(
                r#" manim  /etc/nixos/NNC/utils/manim/logo/main.py"#,
            ));

            fs::copy(
                format!(
                    "{}/git/manim/logo/media/videos/main/3840p30/DefaultTemplate.mp4",
                    env::var("HOME").expect("HOME not set")
                ),
                "./logo_anim.mp4",
            )
            .expect("while coppying the logo.mp4 file:");
        }
        "help" => {
            println!("{}", HELP)
        }

        _ => {
            println!("Unknown operation name!");
            println!("{}", HELP)
        }
    };
}
