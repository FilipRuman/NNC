import {makeProject} from '@motion-canvas/core';

import example from './scenes/example?scene';

import {makeProject} from '@motion-canvas/core';
import example from './scenes/example?scene';

import {Code, LezerHighlighter} from '@motion-canvas/2d';
import {parser} from '@lezer/rust';

import {Code, LezerHighlighter} from '@motion-canvas/2d';
import {HighlightStyle} from '@codemirror/language';
import {tags} from '@lezer/highlight';

// Base colors
const base00 = '#24283b', // Background
  // const base01 = '#7982a9'; // Foreground
  base02 = '#414868', // Selection background
  base03 = '#565f89', // Comments, invisible
  base04 = '#c0caf5', // Default foreground (bright blue)
  base05 = '#282e44', // Dark background for panels
  base06 = '#1f2335', // Darker background (gutter)
  // Accent colors
  base07 = '#f7768e', // Errors, invalid
  base08 = '#ff9e64', // Numbers, constants
  base09 = '#e0af68', // Classes, attributes
  base0A = '#9ece6a', // Strings, success
  base0B = '#2ac3de', // Types, parameter
  base0C = '#7aa2f7', // Functions, properties
  base0D = '#bb9af7'; // Keywords, operators
const invalid = '#f7768e',
  darkBackground = base06,
  highlightBackground = '#292e427a', // Line highlight with transparency
  background = base00,
  tooltipBackground = base05,
  selection = '#6f7bb630', // Selection background with transparency
  selectionMatch = '#6f7bb650', // Selection match with transparency
  cursor = base04, // Cursor color
  activeBracketBg = '#3d59a150', // Active bracket background with transparency
  activeBracketBorder = base0C, // Active bracket border
  diagnosticWarning = base08, // Warning color
  linkColor = base0B, // Link color
  visitedLinkColor = base0D; // Visited link color

const MyStyle = HighlightStyle.define([
 { tag: tags.keyword, color: base0D, fontWeight: 'bold' },
  { tag: tags.controlKeyword, color: base0D, fontWeight: 'bold' },
  { tag: tags.moduleKeyword, color: base0D, fontWeight: 'bold' },

  // Names and variables
  { tag: [tags.name, tags.deleted, tags.character, tags.macroName], color: base04 },
  { tag: [tags.variableName], color: base04 },
  { tag: [tags.propertyName], color: base0C, fontStyle: 'normal' },

  // Classes and types
  { tag: [tags.typeName], color: base0B },
  { tag: [tags.className], color: base09, fontStyle: 'italic' },
  { tag: [tags.namespace], color: base0C, fontStyle: 'italic' },

  // Operators and punctuation
  { tag: [tags.operator, tags.operatorKeyword], color: base0D },
  { tag: [tags.bracket], color: base03 },
  { tag: [tags.brace], color: base03 },
  { tag: [tags.punctuation], color: base03 },


  // Functions and parameters
  { tag: [tags.function(tags.variableName)], color: base0C },
  { tag: [tags.labelName], color: base0C, fontStyle: 'italic' },
  { tag: [tags.definition(tags.function(tags.variableName))], color: base0C },
  { tag: [tags.definition(tags.variableName)], color: base04 },

  // Constants and literals
  { tag: tags.number, color: base08 },
  { tag: tags.changed, color: base08 },
  { tag: tags.annotation, color: invalid, fontStyle: 'italic' },
  { tag: tags.modifier, color: base08, fontStyle: 'italic' },
  { tag: tags.self, color: base08 },
  {
    tag: [tags.color, tags.constant(tags.name), tags.standard(tags.name)],
    color: base0D,
  },
  { tag: [tags.atom, tags.bool, tags.special(tags.variableName)], color: base08 },

  // Strings and regex
  { tag: [tags.processingInstruction, tags.inserted], color: base0A },
  { tag: [tags.special(tags.string), tags.regexp], color: '#b4f9f8' },
  { tag: tags.string, color: base0A },

  // Punctuation and structure
  { tag: tags.definition(tags.typeName), color: base0B, fontWeight: 'bold' },
  { tag: [tags.definition(tags.name), tags.separator], color: base04 },

  // Comments and documentation
  { tag: tags.meta, color: base03 },
  { tag: tags.comment, fontStyle: 'italic', color: base03 },
  { tag: tags.docComment, fontStyle: 'italic', color: base03 },

  // HTML/XML elements
  { tag: [tags.tagName], color: base0D },
  { tag: [tags.attributeName], color: base09 },

  // Markdown and text formatting
  { tag: [tags.heading], fontWeight: 'bold', color: '#89ddff' },
  { tag: tags.heading1, color: '#89ddff', fontWeight: 'bold' },
  { tag: tags.heading2, color: '#89ddff' },
  { tag: tags.heading3, color: '#89ddff' },
  { tag: tags.heading4, color: '#89ddff' },
  { tag: tags.heading5, color: '#89ddff' },
  { tag: tags.heading6, color: '#89ddff' },
  { tag: [tags.strong], fontWeight: 'bold', color: base04 },
  { tag: [tags.emphasis], fontStyle: 'italic', color: base0B },

  // Links and URLs
  {
    tag: [tags.link],
    color: visitedLinkColor,
    fontWeight: '500',
    textDecoration: 'underline',
    textUnderlinePosition: 'under',
  },
  {
    tag: [tags.url],
    color: linkColor,
    textDecoration: 'underline',
    textUnderlineOffset: '2px',
  },

  // Special states
  {
    tag: [tags.invalid],
    color: base04,
    textDecoration: 'underline wavy',
    borderBottom: `1px wavy ${invalid}`,
  },
  { tag: [tags.strikethrough], color: invalid, textDecoration: 'line-through' },

  // Enhanced syntax highlighting
  { tag: tags.constant(tags.name), color: base08 },
  { tag: tags.deleted, color: invalid },
  { tag: tags.squareBracket, color: base03 },
  { tag: tags.angleBracket, color: base03 },

  // Additional specific styles
  { tag: tags.monospace, color: base04 },
  { tag: [tags.contentSeparator], color: base0C },
  { tag: tags.quote, color: base03 },
]);

Code.defaultHighlighter = new LezerHighlighter(parser, MyStyle);

export default makeProject({
  scenes: [example],
});


