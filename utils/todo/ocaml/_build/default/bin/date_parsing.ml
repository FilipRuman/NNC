let ( let* ) = Option.bind

type date = { day : int; month : int; year : int }

(*give the sum ofthe days months and years *)
let date_sum target = target.day + (target.month * 31) + (target.year * 365)

let date_add a_date b_date =
  {
    day = a_date.day + b_date.day;
    month = a_date.month + b_date.month;
    year = a_date.year + b_date.year;
  }

let string_of_date value =
  Printf.sprintf "%d.%d.%d" value.day value.month value.year

let date_compare a_date b_date =
  a_date.day == b_date.day
  && a_date.month == b_date.month
  && a_date.year == b_date.year

(* is a_date before b_date *)
let is_date_before a_date b_date = date_sum a_date < date_sum b_date

let get_current_date =
  let tm = Unix.localtime (Unix.time ()) in
  {
    (* tm_year is years since 1900 *)
    year = tm.Unix.tm_year + 1900;
    (* tm_mon is 0..11 *)
    month = tm.Unix.tm_mon + 1;
    day = tm.Unix.tm_mday;
  }

let rec add_date_additions output additions =
  match additions with
  | to_add :: additions -> (
      let value =
        String.sub to_add 1 (String.length to_add - 1) |> int_of_string_opt
      in
      match value with
      | Some value ->
          let output =
            match to_add.[0] with
            | 'd' -> { output with day = value }
            | 'm' -> { output with month = value }
            | 'y' -> { output with year = value }
            | _ -> output
          in
          add_date_additions output additions
      | None -> add_date_additions output additions)
  | [] -> output

let parse_date_addition str =
  let* split =
    (*split on + and skip the first split*)
    match String.split_on_char '+' str with
    | first_split :: rest_of_split -> Some rest_of_split
    | [] -> None
  in

  Some (add_date_additions { day = 0; month = 0; year = 0 } split)

let parse_base_date str =
  let split_on_dot = String.split_on_char '.' str in
  Printf.printf "parse_base_date - split_on_dot.length:%d"
    (List.length split_on_dot);
  match split_on_dot with
  | [ day_s; month_s; year_s ] ->
      let day_s =
        if day_s.[0] = ' ' then String.sub day_s 1 (String.length day_s - 1)
        else day_s
      in
      let year_s = List.nth (String.split_on_char '+' year_s) 0 in
      Printf.printf "day: '%s' month: '%s' year: '%s'" day_s month_s year_s;
      let* day = int_of_string_opt day_s in
      let* month = int_of_string_opt month_s in
      let* year = int_of_string_opt year_s in
      Some { day; month; year }
  | _ -> None

(*data can look like this 02.03.2026+d4+w2 or without the base date to use the today's date +d1+w5 *)
let parse_date str =
  (* this just makes my life easier*)
  let str = " " ^ str in

  (* eg. 02.03.2026 *)
  let base_date =
    match parse_base_date str with
    | Some date -> date
    | None -> get_current_date
  in
  let add_date =
    match parse_date_addition str with
    | Some value ->
        Printf.printf "parse_date_addition-> Some: '%s'\n"
          (string_of_date value);
        value
    | None ->
        print_endline "parse_date_addition-> Null";
        { day = 0; month = 0; year = 0 }
  in
  Printf.printf "Base date:'%s'; Add date:'%s'\n" (string_of_date base_date)
    (string_of_date add_date);
  date_add base_date add_date
