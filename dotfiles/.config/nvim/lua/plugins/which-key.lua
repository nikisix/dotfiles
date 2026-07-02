local wk = require("which-key")

wk.setup({
    delay = 0,      -- show immediately when <Space> is held
    preset = "classic",
})

-- ── Group labels ────────────────────────────────────────────────────────────
wk.add({
    { "<leader>a",  group = "claude" },
    { "<leader>b",  group = "buffer" },
    { "<leader>c",  group = "code" },
    { "<leader>d",  group = "debug" },
    { "<leader>f",  group = "find" },
    { "<leader>g",  group = "git" },
    { "<leader>gh", group = "hunks" },
    { "<leader>q",  group = "quit/session" },
    { "<leader>s",  group = "search" },
    { "<leader>u",  group = "ui" },
    { "<leader>w",  group = "window" },
    { "<leader>x",  group = "diagnostics" },
})

local map = vim.keymap.set

-- ── Buffer ───────────────────────────────────────────────────────────────────
map("n", "<leader>bb", function() Snacks.picker.buffers() end,       { desc = "Switch Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>",                           { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>%bdelete|edit#|bdelete#<cr>",          { desc = "Delete Other Buffers" })
map("n", "<leader>bn", "<cmd>bnext<cr>",                             { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>",                         { desc = "Previous Buffer" })

-- ── Code / LSP ───────────────────────────────────────────────────────────────
map("n", "<leader>ca", vim.lsp.buf.code_action,                      { desc = "Code Action" })
map("v", "<leader>ca", vim.lsp.buf.code_action,                      { desc = "Code Action" })
map("n", "<leader>cd", vim.diagnostic.open_float,                    { desc = "Line Diagnostics" })
map("n", "<leader>cr", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename" })
map("n", "<leader>cs", function()
    require("trouble").toggle("lsp_document_symbols")
end, { desc = "Document Symbols" })
map("n", "<leader>cS", vim.lsp.buf.workspace_symbol,                 { desc = "Workspace Symbols" })
map("n", "<leader>ci", vim.lsp.buf.incoming_calls,                   { desc = "Incoming Calls" })
map("n", "<leader>co", vim.lsp.buf.outgoing_calls,                   { desc = "Outgoing Calls" })

-- Diagnostic navigation
map("n", "]d", vim.diagnostic.goto_next,                             { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev,                             { desc = "Prev Diagnostic" })
map("n", "]e", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })
map("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error" })

-- LSP navigation
map("n", "gd", vim.lsp.buf.definition,                               { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration,                              { desc = "Go to Declaration" })
map("n", "gr", vim.lsp.buf.references,                               { desc = "References" })
map("n", "gi", vim.lsp.buf.implementation,                           { desc = "Go to Implementation" })
map("n", "gy", vim.lsp.buf.type_definition,                          { desc = "Go to Type Definition" })
map("n", "gK", vim.lsp.buf.signature_help,                           { desc = "Signature Help" })

-- ── Debug ────────────────────────────────────────────────────────────────────
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end,  { desc = "Toggle Breakpoint" })
map("n", "<leader>dB", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end,           { desc = "Continue" })
map("n", "<leader>di", function() require("dap").step_into() end,          { desc = "Step Into" })
map("n", "<leader>do", function() require("dap").step_over() end,          { desc = "Step Over" })
map("n", "<leader>dO", function() require("dap").step_out() end,           { desc = "Step Out" })
map("n", "<leader>dr", function() require("dap").repl.open() end,          { desc = "REPL" })
map("n", "<leader>dt", function() require("dap").terminate() end,          { desc = "Terminate" })
map("n", "<leader>du", function() require("dapui").toggle() end,           { desc = "DAP UI" })
map("n", "<leader>dw", function() require("dap.ui.widgets").hover() end,   { desc = "Hover Value" })

-- ── Explorer (Snacks) ────────────────────────────────────────────────────────
map("n", "<leader>e", function() Snacks.explorer() end,                     { desc = "Explorer (cwd)" })
map("n", "<leader>E", function()
    Snacks.explorer({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Explorer (current file dir)" })

-- ── Find (Snacks picker) ─────────────────────────────────────────────────────
map("n", "<leader>ff", function() Snacks.picker.files() end,                { desc = "Find Files" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end,              { desc = "Buffers" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end,            { desc = "Git Files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end,               { desc = "Recent Files" })
map("n", "<leader>fc", function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Config Files" })

-- ── Git ──────────────────────────────────────────────────────────────────────
-- Fugitive
map("n", "<leader>gg", "<cmd>Git<cr>",                                { desc = "Git Status" })
map("n", "<leader>gG", "<cmd>Git blame<cr>",                          { desc = "Git Blame" })

-- Snacks git pickers
map("n", "<leader>gl", function() Snacks.picker.git_log() end,        { desc = "Git Log" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end,   { desc = "Git Log Line" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end,   { desc = "Git Log File" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end,       { desc = "Git Diff" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end,     { desc = "Git Status Picker" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end,      { desc = "Git Stash" })
map("n", "<leader>gB", function() Snacks.picker.git_branches() end,   { desc = "Git Branches" })

-- Gitsigns hunk operations
map("n", "<leader>ghs", function() require("gitsigns").stage_hunk() end,          { desc = "Stage Hunk" })
map("n", "<leader>ghr", function() require("gitsigns").reset_hunk() end,          { desc = "Reset Hunk" })
map("v", "<leader>ghs", function()
    require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage Hunk" })
map("v", "<leader>ghr", function()
    require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset Hunk" })
map("n", "<leader>ghS", function() require("gitsigns").stage_buffer() end,        { desc = "Stage Buffer" })
map("n", "<leader>ghR", function() require("gitsigns").reset_buffer() end,        { desc = "Reset Buffer" })
map("n", "<leader>ghp", function() require("gitsigns").preview_hunk() end,        { desc = "Preview Hunk" })
map("n", "<leader>ghb", function() require("gitsigns").blame_line({ full = true }) end, { desc = "Blame Line" })
map("n", "<leader>ghd", function() require("gitsigns").diffthis() end,            { desc = "Diff This" })
map("n", "<leader>ghD", function() require("gitsigns").diffthis("~") end,         { desc = "Diff This ~" })

-- Hunk navigation
map("n", "]h", function() require("gitsigns").next_hunk() end,        { desc = "Next Hunk" })
map("n", "[h", function() require("gitsigns").prev_hunk() end,        { desc = "Prev Hunk" })

-- ── Quit / Session ───────────────────────────────────────────────────────────
map("n", "<leader>qq", "<cmd>qa<cr>",                                       { desc = "Quit All" })
map("n", "<leader>qs", function() require("persistence").save() end,        { desc = "Save Session" })
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Load Last Session" })
map("n", "<leader>qd", function() require("persistence").load() end,        { desc = "Load Session (cwd)" })

-- ── Search ───────────────────────────────────────────────────────────────────
-- Text search
map("n", "<leader>sg", function() Snacks.picker.grep() end,                       { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end,         { desc = "Search Word" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end,               { desc = "Grep Open Buffers" })
map("n", "<leader>sr", function() require("grug-far").open() end,                 { desc = "Search & Replace" })
map("n", "<leader>sR", function()
    require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Search & Replace Word" })
-- Neovim internals
map("n", "<leader>sh", function() Snacks.picker.help() end,                       { desc = "Help Pages" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end,                    { desc = "Keymaps" })
map("n", "<leader>sc", function() Snacks.picker.commands() end,                   { desc = "Commands" })
map("n", "<leader>sC", function() Snacks.picker.command_history() end,            { desc = "Command History" })
map("n", "<leader>sH", function() Snacks.picker.highlights() end,                 { desc = "Highlights" })
map("n", "<leader>sM", function() Snacks.picker.man() end,                        { desc = "Man Pages" })
map("n", "<leader>sm", function() Snacks.picker.marks() end,                      { desc = "Marks" })
map("n", "<leader>sj", function() Snacks.picker.jumps() end,                      { desc = "Jump List" })
map("n", "<leader>sa", function() Snacks.picker.autocmds() end,                   { desc = "Autocmds" })
map("n", "<leader>s.", function() Snacks.picker.resume() end,                     { desc = "Resume Last Picker" })
-- Diagnostics / TODO
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end,                { desc = "Diagnostics" })
map("n", "<leader>st", "<cmd>TodoTrouble<cr>",                                    { desc = "TODO (Trouble)" })

-- ── UI toggles ───────────────────────────────────────────────────────────────
map("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorscheme" })
map("n", "<leader>us", "<cmd>set spell!<cr>",          { desc = "Toggle Spell" })
map("n", "<leader>uw", "<cmd>set wrap!<cr>",           { desc = "Toggle Wrap" })
map("n", "<leader>un", "<cmd>set number!<cr>",         { desc = "Toggle Line Numbers" })
map("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "Toggle Relative Numbers" })
map("n", "<leader>uc", "<cmd>set cursorline!<cr>",     { desc = "Toggle Cursor Line" })

-- ── Window ───────────────────────────────────────────────────────────────────
map("n", "<leader>ws", "<cmd>split<cr>",   { desc = "Split Horizontal" })
map("n", "<leader>wv", "<cmd>vsplit<cr>",  { desc = "Split Vertical" })
map("n", "<leader>wq", "<cmd>close<cr>",   { desc = "Close Window" })
map("n", "<leader>wh", "<c-w>h",           { desc = "Move Left" })
map("n", "<leader>wj", "<c-w>j",           { desc = "Move Down" })
map("n", "<leader>wk", "<c-w>k",           { desc = "Move Up" })
map("n", "<leader>wl", "<c-w>l",           { desc = "Move Right" })
map("n", "<leader>w=", "<c-w>=",           { desc = "Equalize Windows" })

-- ── Diagnostics (Trouble) ────────────────────────────────────────────────────
map("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end,  { desc = "Diagnostics" })
map("n", "<leader>xX", function()
    require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
end, { desc = "Buffer Diagnostics" })
map("n", "<leader>xs", function() require("trouble").toggle("symbols") end,       { desc = "Symbols" })
map("n", "<leader>xl", function() require("trouble").toggle("lsp") end,           { desc = "LSP References" })
map("n", "<leader>xL", function() require("trouble").toggle("loclist") end,       { desc = "Location List" })
map("n", "<leader>xQ", function() require("trouble").toggle("qflist") end,        { desc = "Quickfix List" })
