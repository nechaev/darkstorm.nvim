---@class Darkstorm
local Darkstorm = {}

local function get_colors()
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

local function get_groups()
  local c = get_colors()

  local groups = {
    Comment = { fg = c.comment, italic = true }, -- any comment
    ColorColumn = { bg = c.colorcolumn }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.dark5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.fg }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    WinSeparator = { fg = c.border, bold = true }, -- the column separating vertically split windows
    Folded = { bg = c.columns.bg, fg = c.columns.fg }, -- line used for closed folds
    FoldColumn = { bg = c.columns.bg, fg = c.columns.fg }, -- 'foldcolumn'
    SignColumn = { bg = c.columns.bg, fg = c.columns.fg }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.columns.bg, fg = c.columns.fg }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.bg }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.columns.fg, bg = c.columns.bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.fg, bg = c.columns.bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- MatchParen = { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.grey2 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = c.fg_float, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.fg, bg = c.bg_float },
    FloatTitle = { fg = c.fg, bg = c.bg_float },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = c.fg_gutter }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.bg_popup }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = c.grey2 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.columns.bg, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.columns.bg }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.fg, bg = c.bg }, -- tab pages line, active tab page label
    Title = { fg = c.orange, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.grey2 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    WinBar = { link = "StatusLine" }, -- window bar
    WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.magenta }, -- (preferred) any constant
    String = { fg = c.green }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    Number = { fg = c.blue }, --   a number constant: 234, 0xff
    Boolean = { fg = c.orange }, --  a boolean constant: TRUE, false
    Float = { link = "Number" }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.magenta }, -- (preferred) any variable name
    Function = { fg = c.fg }, -- function name (also: methods for classes)

    Statement = { fg = c.orange }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    Label = { fg = c.orange }, --    case, default, etc.
    Operator = { fg = c.fg }, -- "sizeof", "+", "*", etc.
    -- Keyword = { }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.orange }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.orange }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.orange }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    Delimiter = { link = "Special" }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    Debug = { fg = c.orange }, --    debugging statements

    Underlined = { fg = c.blue, underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Italic = { italic = true, fg = c.fg }, -- (preferred) any italic text

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { fg = c.yellow, italic = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.grey }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticSignError = { bg = c.columns.bg, fg = c.error },
    DiagnosticSignWarn = { bg = c.columns.bg, fg = c.warning },
    DiagnosticSignInfo = { bg = c.columns.bg, fg = c.info },
    DiagnosticSignHint = { bg = c.columns.bg, fg = c.hint },

    -- These groups are for the Neovim tree-sitter highlights.
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@number.float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "Macro" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@operator" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.method" },
    ["@namespace.builtin"] = { link = "@variable.builtin" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@tag"] = { fg = c.yellow },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@markup"] = { link = "@none" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },
    ["@comment.note"] = { fg = c.hint },
    ["@comment.error"] = { fg = c.error },
    ["@comment.hint"] = { fg = c.hint },
    ["@comment.info"] = { fg = c.info },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.todo"] = { fg = c.todo },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@type"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "@keyword" },

    -- php
    ["@tag.php"] = { fg = c.orange },
    ["@type.php"] = { fg = c.fg },
    ["@punctuation.bracket.php"] = { fg = c.fg },
    ["@punctuation.delimiter.php"] = { fg = c.fg },
    ["@module.php"] = { fg = c.fg },
    ["@function.method.php"] = { fg = c.yellow },
    ["@function.method.call.php"] = { fg = c.yellow },
    ["@function.call.php"] = { fg = c.yellow },
    ["@constructor.php"] = { fg = c.yellow },
    ["@variable.php"] = { fg = c.magenta },
    ["@variable.builtin.php"] = { fg = c.magenta },
    ["@property.php"] = { fg = c.magenta },
    ["@attribute.phpdoc"] = { fg = c.green1, bold = true, underline = true },
    ["@none.phpdoc"] = { fg = c.green1 },
    ["@comment.phpdoc"] = { fg = c.green1 },
    ["@comment.documentation.php"] = { fg = c.green1 },
    ["@type.phpdoc"] = { fg = c.fg, italic = true },
    ["@nospell.phpdoc"] = { fg = c.magenta },

    -- css
    ["@type.css"] = { fg = c.yellow },
    ["@class.name.css"] = { fg = c.yellow },
    ["@class.selector.css"] = { fg = c.fg },
    ["@id.name.css"] = { fg = c.yellow },
    ["@property.id.css"] = { fg = c.yellow },
    ["@property.value.unit"] = { fg = c.lime },
    ["@id.selector.css"] = { fg = c.yellow },
    ["@property.name.css"] = { fg = c.fg },
    ["@property.value.css"] = { fg = c.lime },
    ["@punctuation.delimiter.css"] = { fg = c.fg },
    ["@function.css"] = { fg = c.yellow },
    ["@punctuation.bracket.css"] = { fg = c.fg },
    ["@attribute.css"] = { fg = c.yellow },

    -- js
    ["@function.method.call.javascript"] = { fg = c.yellow },
    ["@variable.javascript"] = { fg = c.fg },
    ["@function.javascript"] = { fg = c.yellow },
    ["@punctuation.bracket.javascript"] = { fg = c.fg },
    ["@lsp.type.variable.javascript"] = { fg = c.fg },
    ["@variable.builtin.javascript"] = { fg = c.magenta, italic = true },
    ["@function.builtin.javascript"] = { fg = c.yellow },
    ["@lsp.mod.defaultLibrary.javascript"] = { fg = c.magenta, italic = true },
    ["@function.method.javascript"] = { fg = c.yellow },
    ["@lsp.typemod.member.defaultLibrary.javascript"] = { fg = c.yellow, italic = false },

    ["@punctuation.bracket.json"] = { fg = c.fg },

    -- html
    ["@constant.html"] = { fg = c.yellow },
    ["@tag.attribute.html"] = { fg = c.fg },
    ["@string.html"] = { fg = c.lime },
    ["@tag.delimiter.html"] = { fg = c.yellow },
    ["@string.special.url.html"] = { fg = c.none },

    -- markdown
    ["@markup.heading.1.markdown"] = { fg = c.magenta },
    ["@markup.heading.2.markdown"] = { fg = c.magenta },
    ["@markup.heading.3.markdown"] = { fg = c.magenta },
    ["@markup.heading.4.markdown"] = { fg = c.magenta },
    ["@markup.heading.5.markdown"] = { fg = c.magenta },
    ["@markup.link.label.markdown_inline"] = { fg = c.blue, underline = true },
    ["@markup.link.url.markdown_inline"] = { fg = c.yellow, italic = true, underline = false },

    -- bash
    ["@function.call.bash"] = { fg = c.orange },
    ["@variable.parameter.bash"] = { fg = c.fg },

    -- Noice

    NoiceCmdlinePopup = { link = "Normal" },
    NoiceCmdlinePopupBorder = { link = "Normal" },
    NoiceCmdlineIcon = { link = "Normal" },
    NoiceCmdlinePopupTitle = { link = "Normal" },

    -- neo-tree
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

    -- diffview
    DiffviewFilePanelCounter = { fg = c.fg },
    DiffviewNonText = { fg = c.fg },
    DiffviewStatusAdded = { fg = c.git.add },
    DiffviewStatusDeleted = { fg = c.red },
    DiffviewStatusModified = { fg = c.sidebar.modified },
    DiffviewNormal = { bg = c.columns.bg },
    DiffviewWinSeparator = { link = "DiffviewNormal" },
    DiffviewEndOfBuffer = { link = "DiffviewNormal" },
    DiffviewCursorLine = { bg = c.bg },

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add, bg = c.columns.bg }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change, bg = c.columns.bg }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete, bg = c.columns.bg }, -- diff mode: Deleted line |diff.txt|
  }
  return groups
end

--- main load function
Darkstorm.load = function()
  -- reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end
  vim.g.colors_name = "darkstorm"
  vim.o.termguicolors = true
  vim.o.background = "dark"

  local groups = get_groups()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

Darkstorm.setup = function(options)
  -- Nothing to setup
end

return Darkstorm
