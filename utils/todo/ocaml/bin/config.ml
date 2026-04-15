type parsed_config = { base_path : string; open_command : string }

let get_project_home_path () =
  let executable_path = Sys.argv.(0) in
  let to_remove = String.length "/_build/install/default/bin/todo" in
  String.sub executable_path 0 (String.length executable_path - to_remove)

(* returns list of lines *)
let read_config () =
  let home_path = get_project_home_path () in
  In_channel.with_open_text (home_path ^ "/config") In_channel.input_lines

let get_base_path () =
  let lines = read_config () in
  List.iter (fun line -> print_endline line) lines

(* returns list of lines *)
let read_config () =
  let home_path = get_project_home_path () in
  In_channel.with_open_text (home_path ^ "/config") In_channel.input_lines

let rec parse_config_recursive
    ((lines : string list), (line_index : int), (config : parsed_config)) :
    (parsed_config, string) result =
  match lines with
  | [] -> Ok config
  | line :: lines -> (
      let split = String.split_on_char '=' line in
      if List.length split < 2 then
        Error
          (Printf.sprintf "configuration at line %d is not valid!" line_index)
      else
        let config_name = List.nth split 0 in
        let config_val = List.nth split 1 in
        match config_name with
        | "base_path" ->
            parse_config_recursive
              (lines, line_index + 1, { config with base_path = config_val })
        | "open_command" ->
            parse_config_recursive
              (lines, line_index + 1, { config with open_command = config_val })
        | _ ->
            Error
              (Printf.sprintf "configuration at line %d is not valid!"
                 line_index))

let get_parsed_config () : (parsed_config, string) result =
  let lines = read_config () in
  parse_config_recursive (lines, 0, { open_command = ""; base_path = "" })
