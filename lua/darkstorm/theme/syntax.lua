local M = {}

M.setup = function(c)
	-- These groups are not listed as default vim groups,
	-- but they are defacto standard group names for syntax highlighting.
	-- commented out groups should chain up to their "preferred" group by
	-- default,
	-- Uncomment and edit if you want more specific syntax highlighting.
	return {
		Constant = { fg = c.magenta }, -- (preferred) any constant
		String = { fg = c.green }, --   a string constant: "this is a string"
		Character = { fg = c.green }, --  a character constant: 'c', '\n'
		Number = { fg = c.blue }, --   a number constant: 234, 0xff
		Boolean = { fg = c.orange }, --  a boolean constant: TRUE, false
		Float = { link = "Number" }, --    a floating point constant: 2.3e10

		Identifier = { fg = c.magenta }, -- (preferred) any variable name
		Function = { fg = c.fg }, -- function name (also: methods for classes)

		Statement = { fg = c.orange }, -- (preferred) any statement
		-- Conditional   = { }, --  if, then, else, endif, switch, etc.
		-- Repeat        = { }, --   for, do, while, etc.
		Label = { fg = c.orange }, --    case, default, etc.
		Operator = { fg = c.fg }, -- "sizeof", "+", "*", etc.
		-- Keyword = { }, --  any other keyword
		-- Exception     = { }, --  try, catch, throw

		PreProc = { fg = c.orange }, -- (preferred) generic Preprocessor
		-- Include       = { }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = c.orange }, -- (preferred) int, long, char, etc.
		-- StorageClass  = { }, -- static, register, volatile, etc.
		-- Structure     = { }, --  struct, union, enum, etc.
		-- Typedef       = { }, --  A typedef

		Special = { fg = c.orange }, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		Delimiter = { link = "Special" }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		Debug = { fg = c.orange }, --    debugging statements

		Underlined = { fg = c.blue, underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true, fg = c.fg }, -- (preferred) any bold text
		Italic = { italic = true, fg = c.fg }, -- (preferred) any italic text

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = c.error }, -- (preferred) any erroneous construct
		Todo = { fg = c.yellow, italic = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticUnnecessary = { fg = c.grey }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticSignError = { bg = c.columns.bg, fg = c.error },
		DiagnosticSignWarn = { bg = c.columns.bg, fg = c.warning },
		DiagnosticSignInfo = { bg = c.columns.bg, fg = c.info },
		DiagnosticSignHint = { bg = c.columns.bg, fg = c.hint },

		-- These groups are for the Neovim tree-sitter highlights.
		["@annotation"] = { link = "PreProc" },
		["@attribute"] = { link = "PreProc" },
		["@boolean"] = { link = "Boolean" },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@comment"] = { link = "Comment" },
		["@keyword.conditional"] = { link = "Conditional" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Special" },
		["@constant.macro"] = { link = "Define" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.directive.define"] = { link = "Define" },
		["@keyword.exception"] = { link = "Exception" },
		["@number.float"] = { link = "Float" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Special" },
		["@function.call"] = { link = "@function" },
		["@function.macro"] = { link = "Macro" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.coroutine"] = { link = "@keyword" },
		["@keyword.operator"] = { link = "@operator" },
		["@keyword.return"] = { link = "@keyword" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.method" },
		["@namespace.builtin"] = { link = "@variable.builtin" },
		["@none"] = {},
		["@number"] = { link = "Number" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.storage"] = { link = "StorageClass" },
		["@string"] = { link = "String" },
		["@markup.link.label"] = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@tag"] = { fg = c.yellow },
		["@tag.attribute"] = { link = "@property" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@markup"] = { link = "@none" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "Type" },
		["@markup.raw"] = { link = "String" },
		["@markup.math"] = { link = "Special" },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Title" },
		["@comment.note"] = { fg = c.hint },
		["@comment.error"] = { fg = c.error },
		["@comment.hint"] = { fg = c.hint },
		["@comment.info"] = { fg = c.info },
		["@comment.warning"] = { fg = c.warning },
		["@comment.todo"] = { fg = c.todo },
		["@markup.link.url"] = { link = "Underlined" },
		["@type"] = { link = "Type" },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "@keyword" },
	}
end
return M
