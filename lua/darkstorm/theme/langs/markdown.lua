local M = {}
M.get = function(c)
	return {
		["@markup.heading.1.markdown"] = { fg = c.magenta },
		["@markup.heading.2.markdown"] = { fg = c.magenta },
		["@markup.heading.3.markdown"] = { fg = c.magenta },
		["@markup.heading.4.markdown"] = { fg = c.magenta },
		["@markup.heading.5.markdown"] = { fg = c.magenta },
		["@markup.link.label.markdown_inline"] = { fg = c.blue, underline = true },
		["@markup.link.url.markdown_inline"] = { fg = c.yellow, italic = true, underline = false },
	}
end
return M
