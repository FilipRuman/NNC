(* let file_pathparsed_arguments : Arguments.parsed_arguments(parsed_arguments : Arguments.parsed_arguments) =   *)

let get_file_path
    ( (parsed_arguments : Arguments.parsed_arguments),
      (parsed_config : Config.parsed_config) ) =
  match parsed_arguments.path with
  | Some file_path -> parsed_config.base_path ^ file_path
  | None -> (
      match parsed_arguments.title with
      | Some file_name -> parsed_config.base_path ^ file_name ^ ".todo.md"
      | None -> parsed_config.base_path ^ "default.todo.md")

let some_or_blank (input : string option) =
  match input with Some s -> s | None -> ""

let get_metadata_string
    ( (parsed_arguments : Arguments.parsed_arguments),
      (parsed_config : Config.parsed_config) ) =
  [
    Option.map (Printf.sprintf "Title: %s") parsed_arguments.title;
    Option.map
      (Printf.sprintf "Date: %s")
      (match parsed_arguments.date with
      | Some date -> Some (Date_parsing.string_of_date date)
      | None -> None);
    (if parsed_arguments.is_done then Some "Done: true" else None);
  ]
  |> List.filter_map Fun.id |> String.concat "\n"

let get_file_contents
    ( (parsed_arguments : Arguments.parsed_arguments),
      (parsed_config : Config.parsed_config) ) =
  let contents = some_or_blank parsed_arguments.contents in
  let metadata = get_metadata_string (parsed_arguments, parsed_config) in
  Printf.sprintf "---\n%s\n---\n%s" metadata contents

let open_file (parsed_config : Config.parsed_config) path =
  Printf.printf "Open command: %s %S" parsed_config.open_command path;
  ignore (Sys.command (Printf.sprintf "%s %S" parsed_config.open_command path))

let handle_create_command
    ( (parsed_arguments : Arguments.parsed_arguments),
      (parsed_config : Config.parsed_config) ) =
  let path = get_file_path (parsed_arguments, parsed_config) in
  let contents = get_file_contents (parsed_arguments, parsed_config) in

  let out_chan = open_out path in
  output_string out_chan contents;
  flush out_chan;

  if parsed_arguments.open_file then open_file parsed_config path;
  Printf.printf "File created at: '%s' \n" path
