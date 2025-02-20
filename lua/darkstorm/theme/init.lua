local Palette = require("darkstorm.theme.palette")
local Util = require("darkstorm.util")

---@class DarkstormTheme
local M = {}

setmetatable(M, {
	__index = function(_, k)
		local plugin = require("darkstorm.theme.plugins" .. k)
		return plugin
	end,
})

local Plugins = {
	"diffview",
	"gitsigns",
	"neo-tree",
	"noice",
	"which-key",
}

local Langs = {
	"bash",
	"css",
	"html",
	"js",
	"markdown",
	"php",
}

local PrepareLangs = {
	"php",
	"css",
}

local function get_hl_group_tbl(colors)
	local editor = require("darkstorm.theme.editor").setup(colors)
	local syntax = require("darkstorm.theme.syntax").setup(colors)
	local hl_group_tbl = {}

	hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, editor, syntax)

	for _, name in ipairs(Plugins) do
		local config_ok, plugin = xpcall(require, function(...)
			Util.log("Failed to load highlight group: " .. name .. "\n" .. debug.traceback(...), "error")
			return ...
		end, "darkstorm.theme.plugins." .. name)
		if config_ok then
			hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, plugin.get(colors))
		end
	end

	for _, name in ipairs(Langs) do
		local config_ok, lang = xpcall(require, function(...)
			Util.log("Failed to load highlight group: " .. name .. "\n" .. debug.traceback(...), "error")
			return ...
		end, "darkstorm.theme.langs." .. name)
		if config_ok then
			hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, lang.get(colors))
		end
	end

	return hl_group_tbl
end

M.prepare = function()
	local ok, ts = pcall(require, "vim.treesitter.query")
	if not ok then
		return
	end

	for _, langname in ipairs(PrepareLangs) do
		local ret, lang = xpcall(require, function(...)
			Util.log("Failed to prepare " .. langname .. "\n" .. debug.traceback(...), "error")
			return ...
		end, "darkstorm.theme.langs." .. langname)
		if ret then
			-- ts.set(langname, "highlights", lang.get_ts_query())
		end
	end
end
M.setup = function()
	local hl_group_tbl = get_hl_group_tbl(Palette.get_colors())
	return hl_group_tbl
end

return M
