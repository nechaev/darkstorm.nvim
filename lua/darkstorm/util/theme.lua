---@class darkstorm.util.theme
local M = {}

function M.load(hl_group_tbl)
	-- reset colors
	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end

	vim.g.colors_name = "darkstorm"
	vim.o.termguicolors = true
	vim.o.background = "dark"

	for group, settings in pairs(hl_group_tbl) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
