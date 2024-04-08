# Darkstorm

A dark Neovim theme written in Lua. Reproduction of the official JetBrains IDE Darcula theme.

## ⚡️ Supported languages

- PHP
- Javascript / JSON
- HTML
- CSS
- Markdown

## 🔌 Plugin support

- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)

## 📦 Installation

Install the theme with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "nechaev/darkstorm.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
    config = function()
      vim.cmd([[colorscheme darkstorm]])
    end,
}
```

## 🚀 Usage

```lua
vim.cmd[[colorscheme darkstorm]]
```

## 🔥 Contributing

Pull requests are welcome.
