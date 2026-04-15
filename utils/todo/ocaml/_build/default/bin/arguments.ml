type command_type = Show | Help | Create | Remove | Done

type parsed_arguments = {
  command : command_type;
  date : Date_parsing.date option;
  path : string option;
  title : string option;
  contents : string option;
  is_done : bool;
  open_file : bool;
}

let parse_command_type () =
  if Array.length Sys.argv < 2 then Error "No command type"
  else
    let command_type_str = Sys.argv.(1) in
    match command_type_str with
    | "show" | "Show" -> Ok Show
    | "help" | "Help" -> Ok Help
    | "create" | "Create" -> Ok Create
    | "remove" | "Remove" -> Ok Remove
    | "done" | "Done" -> Ok Done
    | _ ->
        Error
          (Printf.sprintf "Command type name is incorrect: '%s'"
             command_type_str)

let rec recursively_parse_arguments
    ( (argument_index : int),
      (argument_type : string),
      (output_data : parsed_arguments) ) =
  let next_index = argument_index + 1 in
  let arg = Sys.argv.(argument_index) in
  if String.get arg 0 = '-' then
    match arg with
    | "-o" | "--open" ->
        let output_data = { output_data with open_file = true } in
        if next_index < Array.length Sys.argv then
          recursively_parse_arguments (next_index, argument_type, output_data)
        else output_data
    | "--done" ->
        let output_data = { output_data with is_done = true } in
        if next_index < Array.length Sys.argv then
          recursively_parse_arguments (next_index, argument_type, output_data)
        else output_data
    | _ ->
        (* use argument as an argument type *)
        if next_index < Array.length Sys.argv then
          recursively_parse_arguments (next_index, arg, output_data)
        else output_data
  else
    let output_data =
      match argument_type with
      | "-d" | "--date" ->
          { output_data with date = Some (Date_parsing.parse_date arg) }
      | "-t" | "--title" -> { output_data with title = Some arg }
      | "-p" | "--path" -> { output_data with path = Some arg }
      | "-c" | "--contents" -> { output_data with contents = Some arg }
      | _ ->
          Printf.printf "ERR: '%s' is not a valid argument type!\n"
            argument_type;
          Help.print_help ();
          output_data
    in

    if next_index < Array.length Sys.argv then
      recursively_parse_arguments (next_index, arg, output_data)
    else output_data

let handle_parsing_arguments () =
  let command_result = parse_command_type () in
  match command_result with
  | Error e -> Error e
  | Ok parsed_command ->
      let output_data =
        {
          command = parsed_command;
          date = None;
          path = None;
          title = None;
          contents = None;
          open_file = false;
          is_done = false;
        }
      in

      let argument_index = 2 in
      (* skip the executable path(0) and the command type(1)*)
      let argument_type = "" in
      (*the argument_type isn't needed because the user will have to put --<type> as the first parsed argument*)
      if Array.length Sys.argv > 2 then
        let output_data =
          recursively_parse_arguments
            (argument_index, argument_type, output_data)
        in
        Ok output_data
      else Ok output_data
