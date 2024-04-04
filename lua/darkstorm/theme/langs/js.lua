local M = {}
M.get = function(c)
	return {
		["@function.method.call.javascript"] = { fg = c.yellow },
		["@variable.javascript"] = { fg = c.fg },
		["@function.javascript"] = { fg = c.yellow },
		["@punctuation.bracket.javascript"] = { fg = c.fg },
		["@lsp.type.variable.javascript"] = { fg = c.fg },
		["@variable.builtin.javascript"] = { fg = c.magenta, italic = true },
		["@function.builtin.javascript"] = { fg = c.yellow },
		["@lsp.mod.defaultLibrary.javascript"] = { fg = c.magenta, italic = true },
		["@function.method.javascript"] = { fg = c.yellow },
		["@lsp.typemod.member.defaultLibrary.javascript"] = { fg = c.yellow, italic = false },

		["@punctuation.bracket.json"] = { fg = c.fg },
	}
end
return M
