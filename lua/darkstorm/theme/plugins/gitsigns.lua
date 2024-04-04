local M = {}
M.get = function(c)
	return {
		GitSignsAdd = { fg = c.gitSigns.add, bg = c.columns.bg }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = c.gitSigns.change, bg = c.columns.bg }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = c.gitSigns.delete, bg = c.columns.bg }, -- diff mode: Deleted line |diff.txt|
	}
end
return M
