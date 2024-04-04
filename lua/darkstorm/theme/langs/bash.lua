local M = {}
M.get = function(c)
	return {
		["@function.call.bash"] = { fg = c.orange },
		["@variable.parameter.bash"] = { fg = c.fg },
	}
end
return M
