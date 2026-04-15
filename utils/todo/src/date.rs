use anyhow::{Context, Result, bail};
use time::macros::format_description;
use time::{Date, Duration, OffsetDateTime};
const FORMAT: time::format_description::StaticFormatDescription =
    format_description!("[day].[month].[year]");
// Example values
// 02.12.2025+d5+m4
// 02.12.2025
// +d5+m4
pub fn parse_date(to_parse: &str) -> Result<Date> {
    let mut split = to_parse.split('+');

    // base date
    let mut output = if to_parse.starts_with('+') {
        // Move past the '' that will be the first in the split.
        split.next();
        OffsetDateTime::now_utc().date()
    } else {
        let base_date = split
            .next()
            .context("There was no base date even tho there should be???")?;
        Date::parse(base_date, FORMAT).with_context(|| {
            format!("Base date was invalid: '{base_date}' - needed format: [day].[month].[year]")
        })?
    };
    for date_offset in split {
        let (offset_type, amount_str) = date_offset.split_at(1);
        let amount: i64 = amount_str.parse().with_context(|| {
            format!("The offset amount:'{amount_str}' isn't a valid i64. whole str:'{date_offset}'")
        })?;
        match offset_type {
            "d" => output += Duration::days(amount),
            "m" => output += Duration::days(amount * 30),
            "y" => output += Duration::days(amount * 365),
            other => {
                bail!(
                    "Date offset of '{date_offset}' is not a valid offset- '{other}' is not a valid offset type, amount:{amount_str}"
                )
            }
        };
    }

    Ok(output)
}
pub fn date_to_str(date: &Date) -> Result<String> {
    date.format(FORMAT).context("")
}
