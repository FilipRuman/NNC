let get_project_home_path () =
  let executable_path = Sys.argv.(0) in
  let to_remove = String.length "/_build/install/default/bin/todo" in
  String.sub executable_path 0 (String.length executable_path - to_remove)

let print_help () =
  (* it will be something like:  /etc/nixos/NNC/utils/todo/_build/install/default/bin/todo *)
  (* we want to get /etc/nixos/NNC/utils/todo/help.md *)
  let help_file_path = get_project_home_path () ^ "/help.md" in
  let in_chan = open_in help_file_path in
  let length = in_channel_length in_chan in
  let help = really_input_string in_chan length in
  print_endline help
