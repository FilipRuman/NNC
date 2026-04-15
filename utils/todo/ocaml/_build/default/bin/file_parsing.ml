type parsed_file = {
  title : string;
  date : Date_parsing.date option;
  is_done : bool;
  contents : string;
}

let parse_file path =
  let parsed_file =
    ref { title = ""; date = None; is_done = false; contents = "" }
  in
  let is_meta_data = ref false in
  let contents = ref "" in
  open_in path |> In_channel.input_lines
  |> List.iteri (fun i line ->
      match line with
      | "---" -> is_meta_data := not !is_meta_data
      | _ ->
          if !is_meta_data then (
            let split = String.split_on_char ':' line in

            if List.length split < 2 then
              Printf.printf
                "Inside file '%s' line nr.%d with content '%s' is not a valid \
                 metadata"
                path i line
            else
              let meta_data_type = List.nth split 0 in

              let meta_data_value = ref "" in

              List.iteri
                (fun i str ->
                  if i != 0 then
                    if i == 1 then meta_data_value := !meta_data_value ^ str
                    else meta_data_value := !meta_data_value ^ ":" ^ str)
                split;
              match meta_data_type with
              | "title" | "Title" ->
                  parsed_file := { !parsed_file with title = !meta_data_value }
              | "done" | "Done" ->
                  parsed_file := { !parsed_file with is_done = true }
              | "date" | "Date" ->
                  parsed_file :=
                    {
                      !parsed_file with
                      date = Some (Date_parsing.parse_date !meta_data_value);
                    }
              | _ ->
                  Printf.printf
                    "WARN: File '%s' line nr.%d with content '%s' contains \
                     invalid metadata type:'%s' \n"
                    path i line meta_data_type)
          else contents := !contents ^ line);
  !parsed_file

let write_from_file_config path parsed_file parsed_config =
  let parsed_args : Arguments.parsed_arguments =
    {
      command = Show;
      (*whatever*)
      date = parsed_file.date;
      path = None;
      title = Some parsed_file.title;
      contents = Some parsed_file.contents;
      is_done = parsed_file.is_done;
      open_file = false;
    }
  in

  let contents = Create.get_file_contents (parsed_args, parsed_config) in
  output_string (open_out path) contents
