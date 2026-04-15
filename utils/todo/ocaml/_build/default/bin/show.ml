let compare_meta_data (file : string) (argument : string option) =
  match argument with Some arg_val -> arg_val == file | None -> true

let is_file_valid
    ( full_path,
      (parsed_arguments : Arguments.parsed_arguments),
      (parsed_config : Config.parsed_config) ) =
  let contains_todo_extension =
    String.split_on_char '.' full_path |> List.exists (( = ) "todo")
  in
  if not contains_todo_extension then false
  else
    let parsed_file = File_parsing.parse_file full_path in

    let is_date_the_same =
      match parsed_arguments.date with
      | None -> true
      | Some args_date -> (
          match parsed_file.date with
          | None -> true
          | Some file_date -> Date_parsing.date_compare args_date file_date)
    in

    is_date_the_same
    && compare_meta_data parsed_file.title parsed_arguments.title
    && parsed_file.is_done == parsed_arguments.is_done

let collect_valid_files (parsed_arguments : Arguments.parsed_arguments)
    (parsed_config : Config.parsed_config) base_dir =
  let output_list = ref [] in
  let rec iter_thru_dir dir =
    Sys.readdir dir
    |> Array.iter (fun entry ->
        let full_path = Filename.concat dir entry in
        if Sys.is_directory full_path then iter_thru_dir full_path
        else if is_file_valid (full_path, parsed_arguments, parsed_config) then
          output_list := full_path :: !output_list)
  in
  iter_thru_dir base_dir;
  !output_list

type show_settings = { date : bool; title : bool; is_done : bool }

let configure_show_settings (parsed_arguments : Arguments.parsed_arguments)
    (parsed_config : Config.parsed_config) =
  {
    date = parsed_arguments.date == None;
    title = parsed_arguments.title == None;
    is_done = false;
  }

let rec print_files i settings files =
  match files with
  | [] -> ()
  | file_path :: files ->
      let parsed_file = File_parsing.parse_file file_path in
      let output_str = ref "" in
      if settings.date && Option.is_some parsed_file.date then
        output_str :=
          !output_str ^ " date:"
          ^ (Option.get parsed_file.date |> Date_parsing.string_of_date);
      if settings.title && parsed_file.title != "" then
        output_str := !output_str ^ " title:" ^ parsed_file.title;
      if settings.is_done then
        output_str :=
          !output_str ^ " done: " ^ string_of_bool parsed_file.is_done;
      Printf.printf "%d.%s\n" i !output_str;
      print_files (i + 1) settings files

let rec open_file_selection_prompt files
    (to_run_after_selection : string -> unit) =
  print_endline "Write file number to open:";
  let int_option = int_of_string_opt (read_line ()) in

  match int_option with
  | Some file_nr ->
      if file_nr >= 0 && file_nr < List.length files then
        to_run_after_selection (List.nth files file_nr)
      else print_endline "This is not a valid file nubmer!"
  | None -> open_file_selection_prompt files to_run_after_selection

let handle_file_display (parsed_arguments : Arguments.parsed_arguments)
    (parsed_config : Config.parsed_config) =
  let show_confg = configure_show_settings parsed_arguments parsed_config in
  let files =
    collect_valid_files parsed_arguments parsed_config parsed_config.base_path
  in

  print_files 0 show_confg files;
  files

let handle_show_command (parsed_arguments : Arguments.parsed_arguments)
    (parsed_config : Config.parsed_config) =
  let files = handle_file_display parsed_arguments parsed_config in
  if parsed_arguments.open_file then
    open_file_selection_prompt files (fun selected ->
        Create.open_file parsed_config selected)

let handle_remove_command (parsed_arguments : Arguments.parsed_arguments)
    (parsed_config : Config.parsed_config) =
  let files = handle_file_display parsed_arguments parsed_config in
  open_file_selection_prompt files (fun selected -> Sys.remove selected)

let handle_done_command (parsed_arguments : Arguments.parsed_arguments)
    (parsed_config : Config.parsed_config) =
  let files = handle_file_display parsed_arguments parsed_config in
  open_file_selection_prompt files (fun selected ->
      let parsed_file = File_parsing.parse_file selected in
      File_parsing.write_from_file_config selected
        { parsed_file with is_done = true }
        parsed_config)
