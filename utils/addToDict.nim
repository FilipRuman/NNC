import strutils
import strformat
import os

proc getToAddArgument(): string =
        let args = commandLineParams()

        if args.len < 1:
                echo "Usage: addToDict <word-to-add>"
                quit(1)

        return args[0]

proc toAddToFile(): string =
        let toAdd = getToAddArgument();
        return fmt("\n    \"{toAdd}\"");
proc main () =

        const dictFilePath = "/etc/nixos/NNC/home/apps/spellcheck.nix"
        var fileContents = readFile(dictFilePath);
        let wordArrayDeclearePos = fileContents.find("words ");
        if wordArrayDeclearePos == -1:
                echo "the spellcheck.nix file is not correctrly formatted -> it doesn`t contain a words array!"
                quit(1)
        let wordArrayStartPos = fileContents.find("[", wordArrayDeclearePos);
        fileContents.insert(toAddToFile(), wordArrayStartPos +
                        1) # + 1 to insert after the `[` char
        writeFile(dictFilePath, fileContents);
main()
