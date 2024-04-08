local M = {}

M.get = function(c)
	return {
		WhichKey = { fg = c.orange },
		WhichKeyBorder = { bg = c.bg_float, fg = c.fg },
		WhichKeySeparator = { fg = c.grey },
		WhichKeyGroup = { fg = c.yellow },
		WhichKeyDesc = { fg = c.fg },
	}
end

return M
