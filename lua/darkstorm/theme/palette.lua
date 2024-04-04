---@class Pallete
local M = {}

M.get_colors = function()
	local colors = {
		none = "NONE",
		bg_light = "#3d3f41",
		bg = "#232525",
		bg_highlight = "#323232",
		fg = "#a9b7c6",
		fg_light = "#bbbbbb",
		fg_gutter = "#3b4261",
		grey = "#808080",
		grey2 = "#373737",
		dark3 = "#545c7e",
		dark5 = "#737aa2",
		blue = "#7aa2f7",
		magenta = "#9876aa",
		orange = "#cc7832",
		yellow = "#ffc66d",
		green = "#6a8759",
		green1 = "#6e965c",
		teal = "#1abc9c",
		red = "#ad3d3a",
		lime = "#aac16e",
		git = { change = "#323b46", add = "#2f4337", delete = "#3f546e" },
		gitSigns = {
			add = "#6a8759",
			change = "#6897bb",
			delete = "#ad3d3a",
		},
	}

	colors.sidebar = {
		bg = colors.bg_light,
		fg = colors.fg_light,
		ignored = "#848529",
		untracked = "#c36d5f",
		modified = "#7296b8",
		added = "#6e965c",
		cursorline_bg = "#3d63c3",
		cursorline_fg = "#ffffff",
	}

	colors.comment = colors.grey

	colors.colorcolumn = "#373737"
	colors.columns = {
		bg = "#313335",
		fg = "#606366",
	}
	colors.diff = {
		add = "#2f4337",
		change = "#323b46",
		delete = "#3f546e",
		text = "#536c9e",
	}

	colors.git.ignore = colors.dark3
	colors.border = "#373737"

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.bg_light
	colors.bg_statusline = colors.bg_light

	-- Sidebar and Floats
	colors.bg_sidebar = colors.bg_light
	colors.bg_float = colors.bg_light

	colors.bg_visual = "#3d63c3"
	colors.bg_search = "#3b583f"
	colors.fg_sidebar = colors.fg_light
	colors.fg_float = colors.fg

	colors.error = colors.red
	colors.todo = colors.yellow
	colors.warning = colors.yellow
	colors.info = colors.blue
	colors.hint = colors.teal

	return colors
end

return M
