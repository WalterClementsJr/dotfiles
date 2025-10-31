vim.cmd("source ~/.vimrc") -- use base config from Vim

require("config.lazy") -- lazy.nvim

require("lualine").setup()
require("mason").setup()
require("mason-lspconfig").setup()

local opt = vim.opt

opt.inccommand = "split" -- regex replace preview
opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- already have a status line
opt.wildmode = "longest:full,full"
opt.pumblend = 10
opt.jumpoptions = "view"

vim.g.maplocalleader = "\\"

vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.deprecation_warnings = false
vim.g.trouble_lualine = true
vim.g.markdown_recommended_style = 0
vim.g.snacks_animate = false

--------------------------------
-------------keymap-------------
--------------------------------

local keymap = vim.keymap.set
keymap("t", "<Esc><Esc>", "<C-\\><C-n>")

keymap({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("nohlsearch")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })
keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Kill Buffer" })

keymap({ "n", "t" }, "<C-_>", function() Snacks.terminal() end, { desc = "Toggle Terminal", remap = true })
keymap({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal", remap = true })
keymap("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
keymap("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })

Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  :map("<leader>uc")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.inlay_hints():map("<leader>uh")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.dim():map("<leader>uD")

keymap("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
keymap("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
keymap("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
-- find
keymap("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
keymap("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
keymap("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
keymap("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
keymap("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
keymap("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })
-- git
keymap("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
-- Grep
keymap("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
keymap("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
keymap({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
-- search
keymap("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
keymap("n", "<leader>s/", function() Snacks.picker.search_history() end, { desc = "Search History" })
keymap("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
keymap("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
keymap("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
keymap("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
keymap("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
keymap("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
keymap("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
keymap("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
keymap("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
keymap("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
keymap("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
keymap("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
keymap("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
keymap("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
keymap("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
keymap("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
keymap("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
keymap("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
keymap("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
-- LSP
keymap("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Goto Definition" })
keymap("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Goto Declaration" })
keymap("n", "gy", function() vim.lsp.buf.type_definition() end, { desc = "Goto T[y]pe Definition" })
keymap("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
keymap("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
keymap("n", "gK", function() return vim.lsp.buf.signature_help() end, {desc = "Signature Help" })
keymap("i", "<c-k>", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
-- Other
keymap("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
keymap("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
keymap("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
keymap("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
keymap("n", "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
keymap("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
keymap("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
keymap("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
keymap({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
keymap({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
-- Plugins
keymap("n", "<leader>pc", function() Snacks.picker.lsp_config() end, { desc = "Code: LSP Info" })
keymap("n", "<leader>pl", function() vim.cmd("checkhealth *") end, { desc = "Lazy heath check all" })
keymap("n", "<leader>pf", function() vim.cmd("ConformInfo") end, { desc = "Format: Conform Info" })
keymap("n", "<leader>pm", function() vim.cmd("Mason") end, { desc = "Mason" })

-- others
vim.cmd.colorscheme("nightfly")
