local M = {}

M.get = function(c)
	return {
		DiffviewFilePanelCounter = { fg = c.fg },
		DiffviewNonText = { fg = c.fg },
		DiffviewStatusAdded = { fg = c.git.add },
		DiffviewStatusDeleted = { fg = c.red },
		DiffviewStatusModified = { fg = c.sidebar.modified },
		DiffviewNormal = { bg = c.columns.bg },
		DiffviewWinSeparator = { link = "DiffviewNormal" },
		DiffviewEndOfBuffer = { link = "DiffviewNormal" },
		DiffviewCursorLine = { bg = c.bg },
	}
end
return M
