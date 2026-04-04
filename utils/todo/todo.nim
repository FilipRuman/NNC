import os
import strformat
import std/strutils
import times

const mainDirectoryPath = "/home/f/git/todo"
type
        ParsedFile = object
                title: string
                description: string
                date: string
                contents: string

        ArgumentsParsed = object
                commandName: string
                title: string
                date: string
                contents: string

proc get_todo_paths(): seq[string] =
        createDir(mainDirectoryPath)

        for path in walkDirRec(
            mainDirectoryPath,
            yieldFilter = {pcFile},
            followFilter = {pcDir, pcLinkToDir},
            relative = false,
            checkDir = true,
            skipSpecial = false
        ):

                if path.endsWith(".todo.md"):
                        result.add(path)



proc parse_file(path: string): ParsedFile =
        var parsing_meta_data = false # metatata is specified in a ---\n metatata \n---
        var i = 0
        for line in open(path).lines:
                if line == "---":
                        parsing_meta_data = not parsing_meta_data
                        continue

                if not parsing_meta_data:
                        result.contents.add(line)
                else:
                        # metatata format: <metatata type name>: <contents>
                        let space_pos = line.find(' ')
                        if space_pos == 0:
                                continue

                        let name = line[0..space_pos-2] # -2 to skip ": "
                        let content = line[space_pos+1..<line.len]

                        case name:
                        of "Title", "title": result.title = content
                        of "Description",
                                        "description": result.description = content
                        of "Date", "date": result.date = content
                        else:
                                echo fmt"{name} is not a valid metatata name!\n path:{path} line nr:{i} line contents:{line}"
                                continue

                inc(i)
proc help() =
        let help_contents = readFile("/etc/nixos/NNC/utils/todo/help.md")
        echo help_contents


proc parse_argumets(): ArgumentsParsed =

        result.commandName = paramStr(1)
        var currentArgumentType = "";
        for i in 2..paramCount():
                let content = paramStr(i)
                if content.startsWith('-'):
                        currentArgumentType = content
                        continue
                case currentArgumentType:
                of "-d", "--date": result.date = content
                else:
                        echo fmt"{currentArgumentType} is not a valid argument type"



proc main() =
        if paramCount() < 2:
                help()

        let arguments = parse_argumets()


main()

# let paths = get_todo_paths()
# echo "parsed files:"
# for path in paths:
#         let parsed = parse_file(path)
#         echo "  ", parsed.date, " -> ", parsed.title


# let dt = parse("2026-04-02 14:30:00", "yyyy-MM-dd HH:mm:ss")
# let nowUtc = getTime(utc = true)
# let s = format(dt, "yyyy-MM-dd HH:mm:ss")
# import os
#
# echo "Number of arguments: ", paramCount()
#
# for i in 1..paramCount():
#   echo "Arg ", i, ": ", paramStr(i)
