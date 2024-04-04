local M = {}

M.get = function(c)
	return {
		NeoTreeNormal = { fg = c.sidebar.fg, bg = c.sidebar.bg },
		NeoTreeStatusLine = { bg = c.sidebar.bg, fg = c.sidebar.bg },
		NeoTreeEndOfBuffer = { fg = c.sidebar.bg, bg = c.sidebar.bg },
		NeoTreeNormalNC = { fg = c.sidebar.fg, bg = c.sidebar.bg },
		NeoTreeDirectoryIcon = { fg = c.sidebar.fg },
		NeoTreeDirectoryName = { link = "NeoTreeDirectoryIcon" },
		NeoTreeGitIgnored = { fg = c.sidebar.ignored },
		NeoTreeGitUntracked = { fg = c.sidebar.untracked },
		NeoTreeGitDeleted = { fg = c.sidebar.fg },
		NeoTreeGitModified = { fg = c.sidebar.modified }, -- unstaged
		NeoTreeGitRenamed = { fg = c.sidebar.modified },
		NeoTreeGitAdded = { fg = c.sidebar.added },
		NeoTreeGitConflict = { fg = c.orange },
		NeoTreeCursorLine = { bg = c.sidebar.cursorline_bg, fg = c.sidebar.cursorline_fg },
		NeoTreeWinSeparator = { bg = c.sidebar.bg, fg = c.sidebar.bg },
	}
end

return M
