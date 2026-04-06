let message = "Some test things \n escape new line"
let file_path = "./test_file.md"

let handle_command
    ( (parsed_arguments : Arguments.parsed_arguments),
      (parsed_config : Config.parsed_config) ) =
  match parsed_arguments.command with
  | Arguments.Show -> Show.handle_show_command parsed_arguments parsed_config
  | Arguments.Remove ->
      Show.handle_remove_command parsed_arguments parsed_config
  | Arguments.Done -> Show.handle_done_command parsed_arguments parsed_config
  | Arguments.Help -> Help.print_help ()
  | Arguments.Create ->
      Create.handle_create_command (parsed_arguments, parsed_config)

let () =
  let parsed_result = Arguments.handle_parsing_arguments () in
  let config_result = Config.get_parsed_config () in
  match config_result with
  | Error e ->
      print_endline ("ERR: " ^ e ^ " \n");
      Help.print_help ()
  | Ok parsed_config -> (
      match parsed_result with
      | Error e ->
          print_endline ("ERR: " ^ e ^ " \n");
          Help.print_help ()
      | Ok parsed_arguments -> handle_command (parsed_arguments, parsed_config))

(* close_out out_chan *)
(* let out_chan = open_out file_path in *)
(* Printf.fprintf out_chan "arguments: %s" parsed; *)
