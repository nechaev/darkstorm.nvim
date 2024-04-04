local M = {}
M.get = function(c)
	return {
		["@constant.html"] = { fg = c.yellow },
		["@tag.attribute.html"] = { fg = c.fg },
		["@string.html"] = { fg = c.lime },
		["@tag.delimiter.html"] = { fg = c.yellow },
		["@string.special.url.html"] = { fg = c.none },
	}
end
return M
