import { HighlightStyle } from "@codemirror/language";
import { tags } from "@lezer/highlight";

const red = "#e06c86";
const darkRed = "#6a3945";
const purple = "#8e7ad9";
const blue = "#76a6ff";
const gold = "#d8a24d";
const green = "#8fc25f";
const comment = "#c9a15e";
const foreground = "#b7c7f0";


export const MyStyle = HighlightStyle.define([
        // Keywords

        { tag: tags.derefOperator, color: purple },
        { tag: tags.keyword, color: purple },
        { tag: tags.controlKeyword, color: purple },
        { tag: tags.moduleKeyword, color: purple },
        { tag: tags.operatorKeyword, color: purple },

        // Names
        { tag: tags.variableName, color: red },
        { tag: tags.name, color: foreground },

        // Functions
        { tag: tags.function(tags.variableName), color: blue },
        { tag: tags.definition(tags.function(tags.variableName)), color: blue },
        { tag: tags.propertyName, color: blue },
        { tag: tags.typeOperator, color: foreground },
        { tag: tags.operator, color: foreground },

        // Types
        { tag: tags.typeName, color: gold },
        { tag: tags.definition(tags.typeName), color: gold },
        { tag: tags.className, color: gold },

        // Strings
        { tag: tags.string, color: green },

        // Comments
        { tag: tags.comment, color: comment, fontStyle: "italic" },
        { tag: tags.docComment, color: comment, fontStyle: "italic" },

        // Numbers
        { tag: tags.number, color: gold },

        // Macros / namespaces
        { tag: tags.macroName, color: red },
        { tag: tags.namespace, color: red },

        // Punctuation (keep consistent)

        { tag: tags.punctuation, color: darkRed },
        { tag: tags.bracket, color: foreground },
        { tag: tags.brace, color: foreground },
        { tag: tags.squareBracket, color: foreground },
        { tag: tags.angleBracket, color: foreground },


        // Constants / attributes
        { tag: tags.constant(tags.name), color: gold },
        { tag: tags.attributeName, color: gold },
        // Operators (complete coverage for Lezer grammars)
        { tag: tags.derefOperator, color: foreground },
        { tag: tags.arithmeticOperator, color: foreground },
        { tag: tags.logicOperator, color: foreground },
        { tag: tags.bitwiseOperator, color: foreground },
        { tag: tags.compareOperator, color: foreground },
        { tag: tags.updateOperator, color: foreground },
        { tag: tags.definitionOperator, color: foreground },
        { tag: tags.typeOperator, color: foreground },
        { tag: tags.controlOperator, color: foreground },
]);
