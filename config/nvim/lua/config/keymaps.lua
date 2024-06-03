-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Save current file
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file", remap = true })

-- ESC pressing jk
map("i", "jk", "<ESC>", { desc = "jk to esc", noremap = true })

-- Quit Neovim
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Buffer/Neovim", remap = true })

-- files
map("n", "QQ", ":q!<enter>", { noremap = false })
map("n", "WW", ":w!<enter>", { noremap = false })
map("n", "E", "$", { noremap = false })
map("n", "B", "^", { noremap = false })
-- map("n", "TT", ":TransparentToggle<CR>", { noremap = true })
map("n", "ss", ":noh<CR>", { noremap = true })

-- Noice
map("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })

-- Zenmode
map("n", "<leader>zz", "<cmd>ZenMode<cr>", { desc = "Enable ZenMode", noremap = true })

-- Cmake Tools Neovim Plugin
map("n", "<leader>cG", "<cmd>CMakeGenerate<cr>", { desc = "CMakeGenerate", remap = true })
map("n", "<leader>cB", "<cmd>CMakeBuild<cr>", { desc = "CMakeBuild From Generate", remap = true })
map("n", "<leader>cR", "<cmd>CMakeRun<cr>", { desc = "CMakeRun From Build", remap = true })

-- moving a selection by up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- unhilight
map("n", "<leader>h", ":noh<cr>")

-- moving a line to the end of the top of a line
map("n", "J", "mzJ`z")

-- Navigate half page by keeping cursor in middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- when searching keep Navigate the text easier
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- pasting wihtout keeping the previous text in the register
map("x", "<leader>p", [["_dP]])

-- deleting without keeping the previous text in the register
map({ "n", "v" }, "<leader>d", [["_d]])

-- giving exceute permission
map("n", "<C-x>", "<cmd>!chmod +x %<CR>", { silent = true })

-- Select all
map("n", "<S-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

-- Indenting
map("v", "<", "<gv", { desc = "Indenting", silent = true, noremap = true })
map("v", ">", ">gv", { desc = "Indenting", silent = true, noremap = true })

-- navigate to vault
map("n", "<leader>oo", "<cmd> silent !tmux neww tmux-sessionizer ~/Documents/personal/Obsidian/Second-Brain<cr>")

-- convert note to template and remove leading white space
map("n", "<leader>ot", "<cmd>ObsidianTemplate <cr>")
map("n", "<leader>on", "<cmd>ObsidianNew <cr>")

-- search for files in full vault
map("n", "<leader>og", "<cmd>ObsidianSearch<cr>")
map("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>")

-- Paste Images to Obsidian Notes
map("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>")

-- Daily Notes
map("n", "<leader>od", "<cmd>ObsidianDailies<cr>")
map("n", "<leader>oT", "<cmd>ObsidianToday<cr>")

-- Bufferline
-- map("n", "<S-l>", ":bnext<cr>", { desc = "Move to next tab", noremap = true })
-- map("n", "<S-h>", ":bprevious<cr>", { desc = "Move to previous tab", noremap = true })
-- map("n", "<leader>x", ":bd<cr>", { desc = "Close buffer", noremap = true })
