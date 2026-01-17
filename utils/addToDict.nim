import strutils
import strformat
import os

proc getToAddArgument(): seq[string] =
        let args = commandLineParams()

        if args.len < 1:
                echo "Usage: addToDict <word-to-add>"
                quit(1)
        return args;

proc toAddToFile(): string =
        let input_args = getToAddArgument()
        var output = ""
        for word in input_args:
                output = output & fmt("\n    \"{word}\"")

        return output

proc main () =

        const dictFilePath = "/etc/nixos/NNC/home/apps/spellcheck.nix"
        var fileContents = readFile(dictFilePath)
        let wordArrayDeclearePos = fileContents.find("words ")
        if wordArrayDeclearePos == -1:
                echo "the spellcheck.nix file is not correctrly formatted -> it doesn`t contain a words array!"
                quit(1)
        let wordArrayStartPos = fileContents.find("[", wordArrayDeclearePos)
        fileContents.insert(toAddToFile(), wordArrayStartPos +
                        1) # + 1 to insert after the `[` char
        writeFile(dictFilePath, fileContents)

main()
