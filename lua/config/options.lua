-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g   - global (g:) editor variables, (:help vim.g)
-- vim.o   - get or set options, works like :set (:help vim.o)
-- vim.opt - manage list- and map-style options from Lua (:help vim.opt)
-- Examples:
--     vim.g.mapleader = ' '
--     vim.o.compatible = false
--     vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }
--     vim.opt.wildignore:append { "*.pyc", "node_modules" }

vim.cmd.language("en_GB") -- Vim language

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.compatible = false -- Neovim is always nocompatible
vim.o.termguicolors = true -- Enables 24-bit RGB color in the TUI
-- vim.o.guifont = 'Consolas NF:h10' -- Font in GUI mode, e.g. in Neovide
-- vim.g.neovide_cursor_vfx_mode = 'railgun'
-- vim.o.shellslash = false -- Windows only: use forward slashes in paths if set
vim.o.shelltemp = true -- Use temp files for shell commands instead of pipes (see :help shelltemp)
vim.opt.path:append({ "**" }) -- Search current directory recursively (see :help file-searching)

vim.o.number = true -- Show numbers
vim.o.relativenumber = false -- Show relative numbers
vim.o.colorcolumn = "110" -- Columns that are highlighted with ColorColumn color (strings)

-- Behaviour
vim.o.mouse = "a" -- Enable 'a' mouse mode (default 'nvi'), (see :help mouse)
vim.o.timeoutlen = 1000 -- Timeout for multikey hotkeys (e.g.: ;j)
vim.o.hidden = true -- Keep hidden buffers open
vim.o.virtualedit = "block" -- Cursor may go out of text (like in Far editor)
vim.o.scrolloff = 2 -- Keep gap from cursor and top/bottom of page
vim.o.breakindent = true -- Enable break indent
vim.o.updatetime = 2000 -- Decrease update time, default is 4000
vim.o.undofile = true -- Save undo history
vim.o.splitbelow = true -- On split, put new window below of current
vim.o.splitright = true -- On split, put new window right of current
vim.o.confirm = true -- Show yes/no dialog instead of unsaved changes error (see :help confirm)

-- Command-line
vim.o.cmdheight = 0 -- Cmd mode line height, default is 1
vim.o.cmdwinheight = 10 -- Cmd preview window height, default is 7, used in ctrl-f cmd history preview, inccommand preview, etc.
vim.o.showcmd = true -- Display current command input
vim.o.wildmenu = true -- Display all matches in menu
vim.o.wildcharm = 9 -- Char to invoke wildmenu in macroses (9 is <tab>)
vim.opt.wildmode = { "longest", "full" } -- Complete till longest common string first, full second
vim.opt.wildoptions = { "fuzzy", "pum", "tagfile" } -- Cmdline completion behaviour (values: fuzzy, pum, tagfile)

-- Status-line
vim.o.statusline = "%<%f %h%m%r%y%=:%n %b/0x%B  %c-%v,%l(%L) %P" -- Status line printf style template
vim.o.laststatus = 2 -- Always show statusline

-- Search
vim.o.incsearch = true -- Incremental search
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.smartcase = true -- Smartcase: all lower - ignore, any upper - not ignore
vim.g.star_hash_allow_ignorecase = false -- Allow ignorecase in star_hash keybinding handler

-- Non-printable characters and newline mode
vim.o.list = true -- Enable list mode: show non-printable characters
vim.opt.listchars = { tab = "«=»", trail = "·", extends = "▶", precedes = "◀", nbsp = "␣" } -- Strings to use in list mode
vim.opt.fileformats = { "unix" } -- Formats that will be tried when starting to edit buffer

-- Ctags completion and navigation (universal-ctags)
-- https://stackoverflow.com/questions/934233/cscope-or-ctags-why-choose-one-over-the-other
-- https://github.com/dhananjaylatkar/cscope_maps.nvim (cscope support in neovim)
-- usage: ctags --options-maybe=~/.config/ctags --recurse --exclude=dir[ --exclude=dir2] --fields=+lnim --languages=python,graphql --python-kinds=+zl --extras=-r -f .tags "*"
vim.opt.tags = { ".tags;" } -- Search tags file in current directory and all ancestors (see :help file-searching)
vim.opt.complete = { ".", "w", "b", "u", "t" } -- Specifies how ins-completion works, default=.,w,b,u,t
vim.opt.completeopt = { "longest", "popup", "menuone" } -- List of options for Ins-completion, default=menu,popup
vim.o.omnifunc = "syntaxcomplete#Complete" -- Function for insert mode omni completion (c-x c-o)

-- Tabs and spaces
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 4 -- Size of indent in spaces
vim.o.tabstop = 4 -- Size of <tab> in spaces

-- Schedule settings after `UiEnter` which can increase startup-time
vim.schedule(function()
  vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
  vim.cmd("packadd cfilter") -- Install builtin cfilter-plugin, adds Cfilter, Lfilter
  vim.cmd("packadd nvim.undotree") -- Install builtin undotree plugin, adds Undotree
end)

-- LSP Server to use for Python.
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
