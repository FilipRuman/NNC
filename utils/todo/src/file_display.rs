use crate::{date, file_parsing};
use anyhow::Context;

const MAX_LINE_WIDTH: usize = 40;
pub fn split_sentence_on_spaces(text: String) -> (Vec<String>, usize) {
    let mut current_char_index = 0;
    let mut output: Vec<String> = vec![];
    let chars: Vec<char> = text.chars().collect();
    let mut biggest_line_width = 0;
    loop {
        if text.len() - current_char_index < MAX_LINE_WIDTH {
            let len = text.len() - current_char_index;

            biggest_line_width = biggest_line_width.max(len);
            output.push(text[current_char_index..text.len()].to_string());
            break;
        }
        let previous_line_start_char_index = current_char_index;
        current_char_index += MAX_LINE_WIDTH;
        while chars[current_char_index] != ' ' {
            current_char_index -= 1;
            // This part of sentence doesn't have a single space
            if current_char_index == previous_line_start_char_index {
                current_char_index += MAX_LINE_WIDTH;
                break;
            }
        }
        let len = current_char_index - previous_line_start_char_index;
        biggest_line_width = biggest_line_width.max(len);
        output.push(text[previous_line_start_char_index..current_char_index].to_string());
        // Move past the space
        current_char_index += 1;
    }
    (output, biggest_line_width)
}
struct FileDisplayData {
    pub title: Vec<String>,
    pub labels: Vec<String>,
    pub date: String,
    pub file_nr: String,
    pub priority: String,
    pub lines: usize,
}
pub fn convert_string_to_valid_column_cell(value: String, required_length: usize) -> String {
    let half = (required_length - value.len()) as f32 / 2f32;
    let left = half.floor() as usize;
    let right = half.ceil() as usize;
    let out = " ".repeat(left) + &value + &" ".repeat(right) + "|";
    out
}
pub fn display_files_as_grid(files: &Vec<file_parsing::ParsedFile>) {
    // set minimal values
    let mut title_colum_width = "title".len();
    let mut labels_column_width = "labels".len();
    let mut date_column_width = "date".len();
    let mut file_nr_column_width = "i".len();
    let mut priority_column_width = "priority".len();
    let mut file_display_data_vec = vec![];
    for (i, file) in files.iter().enumerate() {
        let title = match &file.title {
            Some(value) => {
                let (splited_text, splited_text_line_max_width) =
                    split_sentence_on_spaces(value.to_string());
                title_colum_width = title_colum_width.max(splited_text_line_max_width);
                splited_text
            }
            None => vec![String::new()],
        };
        let labels = match &file.labels {
            Some(value) => {
                let (splited_text, splited_text_line_max_width) =
                    split_sentence_on_spaces(value.to_string());
                labels_column_width = labels_column_width.max(splited_text_line_max_width);
                splited_text
            }
            None => vec![String::new()],
        };
        let file_nr = i.to_string();
        file_nr_column_width = file_nr_column_width.max(file_nr.len());
        let priority = match file.priority {
            Some(value) => value.to_string(),
            None => String::new(),
        };
        priority_column_width = priority_column_width.max(priority.len());
        let date = match file.date {
            Some(value) => date::date_to_str(&value)
                .context("show file's data")
                .unwrap(),
            None => String::new(),
        };
        date_column_width = date_column_width.max(date.len());

        file_display_data_vec.push(FileDisplayData {
            lines: title.len().max(labels.len()),
            title: title,
            labels: labels,
            date: date,
            file_nr: file_nr,
            priority: priority,
        });
    }
    //I add dot to the end of file number so I need to add 1 width
    file_nr_column_width += 1;
    const COLUMN_SEPARATORS_COUNT: usize = 6;
    let line_width = COLUMN_SEPARATORS_COUNT
        + labels_column_width
        + date_column_width
        + file_nr_column_width
        + priority_column_width
        + title_colum_width;
    // print legend
    {
        println!("{}", "|".to_string() + &"-".repeat(line_width - 2) + "|");
        let title = convert_string_to_valid_column_cell(String::from("title"), title_colum_width);
        let labels =
            convert_string_to_valid_column_cell(String::from("labels"), labels_column_width);
        let (date, file_nr, priority) = (
            convert_string_to_valid_column_cell(String::from("date"), date_column_width),
            convert_string_to_valid_column_cell(String::from("i"), file_nr_column_width),
            convert_string_to_valid_column_cell(String::from("priority"), priority_column_width),
        );
        println!("|{}", file_nr + &title + &date + &labels + &priority);
    }

    for file_display_data in file_display_data_vec.iter_mut() {
        println!("{}", "|".to_string() + &"-".repeat(line_width - 2) + "|");
        for i in 0..file_display_data.lines {
            let title = convert_string_to_valid_column_cell(
                file_display_data
                    .title
                    .get(i)
                    .get_or_insert(&String::new())
                    .to_owned(),
                title_colum_width,
            );
            let labels = convert_string_to_valid_column_cell(
                file_display_data
                    .labels
                    .get(i)
                    .get_or_insert(&String::new())
                    .to_owned(),
                labels_column_width,
            );
            let (date, file_nr, priority) = if i != 0 {
                (
                    convert_string_to_valid_column_cell(String::new(), date_column_width),
                    convert_string_to_valid_column_cell(String::new(), file_nr_column_width),
                    convert_string_to_valid_column_cell(String::new(), priority_column_width),
                )
            } else {
                (
                    convert_string_to_valid_column_cell(
                        file_display_data.date.clone(),
                        date_column_width,
                    ),
                    convert_string_to_valid_column_cell(
                        // Add '.' after the number because I
                        // think that it will look
                        file_display_data.file_nr.clone() + ".",
                        file_nr_column_width,
                    ),
                    convert_string_to_valid_column_cell(
                        file_display_data.priority.clone(),
                        priority_column_width,
                    ),
                )
            };
            println!("|{}", file_nr + &title + &date + &labels + &priority);
        }
    }

    println!("{}", "|".to_string() + &"-".repeat(line_width - 2) + "|");
}
