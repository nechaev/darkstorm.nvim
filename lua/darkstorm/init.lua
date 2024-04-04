local util = require("darkstorm.util")
local theme = require("darkstorm.theme")

---@class Darkstorm
local M = {}

--- main load function
M.load = function()
	theme.prepare()
	util.theme.load(theme.setup())
	-- M.setup()
end

M.setup = function()
	theme.prepare()
end

return M
