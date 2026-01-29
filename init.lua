--- =========================
-- Basic options
-- =========================
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Line numbers
wo.number = true
wo.relativenumber = true

-- Tabs and indentation
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 0
o.autoindent = true
o.smartindent = true

-- Windowing
o.splitright = true
o.colorcolumn = "80,100"
o.wrap = true
o.statusline = "%f %y %m %= %p%%"  -- rough approximation of `set statusline=2`

-- Search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
-- o.smartcase = true  -- uncomment if you want smart case

-- Display
o.list = true
o.listchars = "tab:→\\"
syntax = "on"

-- Timeout for mapped sequences
o.timeoutlen = 200
o.wildignorecase = true

-- =========================
-- Colors / Highlights
-- =========================
-- vim.cmd [[
--  colorscheme evening
--  highlight Function ctermfg=Red
-- ]]
-- highlight Identifier ctermfg=Cyan guifg=#8be9fd
-- highlight Statement ctermfg=Red guifg=#ff00aa
local hl = vim.api.nvim_set_hl
vim.o.termguicolors = true
-- vim.cmd("colorscheme evening")

-- === Core syntax ===
local hl = vim.api.nvim_set_hl

-- =========================
-- Control flow keywords (magenta)
-- =========================
hl(0, "@keyword.if",      { fg = "#C586C0" }) -- if
hl(0, "@keyword.case",    { fg = "#C586C0" }) -- case
hl(0, "@keyword.return",  { fg = "#C586C0" }) -- return

-- Fallback (some parsers collapse these)
hl(0, "@keyword",         { fg = "#C586C0" })

-- =========================
-- Built-in types (blue)
-- =========================
hl(0, "@type.builtin",    { fg = "#569CD6" }) -- void, int, double, bool, float
hl(0, "@type",            { fg = "#4EC9B0" }) -- user-defined types (structs, classes)

-- Legacy fallback
hl(0, "Type",             { fg = "#569CD6" })

-- =========================
-- Functions (VS Code yellow)
-- =========================
hl(0, "@function",        { fg = "#DCDCAA" })
hl(0, "@function.call",   { fg = "#DCDCAA" })

-- =========================
-- Parameters / variables
-- =========================
hl(0, "@variable.parameter", { fg = "#9CDCFE" })
hl(0, "@variable",           { fg = "#9CDCFE" })

-- =========================
-- Operators (neutral)
-- =========================
hl(0, "@operator",        { fg = "#D4D4D4" })

-- =========================
-- Literals
-- =========================
hl(0, "@number",          { fg = "#B5CEA8" })
hl(0, "@string",          { fg = "#CE9178" })

-- =========================
-- Comments
-- =========================
hl(0, "@comment",         { fg = "#6A9955", italic = true })



-- =========================
-- Keymaps
-- =========================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape shortcuts
keymap("i", ";;", "<Esc>", opts)
keymap("n", "q", "<nop>", opts)
keymap("n", "Q", "q", opts)
keymap("v", ";;", "<Esc>", opts)

-- Quit / save
keymap("n", "qq", ":qa!<CR>", opts)
keymap("n", "qw", ":q!<CR>", opts)
keymap("n", "ss", ":wa!<CR>:qa!<CR>", opts)

-- Window navigation
keymap("n", "ff", "<C-w>w", opts)
keymap("n", "fh", "<C-w>h", opts)
keymap("n", "fj", "<C-w>j", opts)
keymap("n", "fk", "<C-w>k", opts)
keymap("n", "fl", "<C-w>l", opts)

-- Jump to matching parens
keymap("n", "`", "%", opts)

-- Auto-close pairs in insert mode
keymap("i", "(", "()<Left>", opts)
keymap("i", "[", "[]<Left>", opts)
keymap("i", "{", "{}<Left>", opts)
keymap("i", '"', '""<Left>', opts)
keymap("i", "'", "''<Left>", opts)

-- =========================
-- Filetype / autocmds
-- =========================
local augroup = vim.api.nvim_create_augroup

-- Netrw vertical split
augroup("netrw_vsplit", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        keymap("n", "o", ":vertical split<CR>", { buffer = true })
    end,
    group = "netrw_vsplit"
})

-- =========================
-- Netrw config
-- =========================
vim.g.netrw_liststyle = 1
vim.g.netrw_winsize = 70



-- =========================
-- Persistent left explorer setup
-- =========================
local start_windows = vim.api.nvim_create_augroup("StartWindows", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
    group = start_windows,
    callback = function()
        -- Open a vertical split
        vim.cmd("vsplit")

        -- Move netrw to left
        vim.cmd("wincmd h")
        vim.cmd("Explore")

        -- Set left pane width
        vim.cmd("vertical resize 25")

        -- Move cursor to right window (main editing area)
        vim.cmd("wincmd l")
    end
})

-- =========================
-- Netrw configuration
-- =========================
vim.g.netrw_browse_split = 2  -- open files in horizontal split (or 4 for previous window)
vim.o.equalalways = false     -- don't auto-resize windows when opening/closing
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.cmd("vertical resize 25") -- enforce width every time netrw opens
    end
})



-- ============================================================================
-- BELOW IS ALL LSP STUFF
-- ============================================================================
-- ~/.config/nvim/init.lua
--- - Enable mouse and clipboard (optional)
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- Enable diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true
})

-- Function to attach clangd to a buffer
local function setup_clangd(bufnr)
    local lsp = vim.lsp

    local root_dir = vim.fs.find({"compile_commands.json", ".git"}, { upward = true })[1]
    root_dir = root_dir and vim.fs.dirname(root_dir) or vim.loop.cwd()

    -- Only start if no clangd client attached to this buffer
    if #vim.lsp.get_clients({ name = "clangd", bufnr = bufnr }) == 0 then
        lsp.start({
            name = "clangd",
            cmd = { "clangd", "--background-index" },
            root_dir = root_dir,
            filetypes = { "c", "cpp", "objc", "objcpp" },
        })
    end
end

-- Autocommand to attach clangd automatically to C/C++ buffers
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp", "objc", "objcpp"},
    callback = function(args)
        setup_clangd(args.buf)
    end
})

-- LSP Keymaps
local keymap_opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_opts)

-- === nvim-cmp setup for autocompletion ===
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if cmp_nvim_lsp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                -- No snippet engine for now
            end
        },
        mapping = {
            ["<C-Down>"] = cmp.mapping.select_next_item(),
            ["<C-Up>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
            { name = "nvim_lsp" },
        }
    })

    -- Update clangd autocmd to include capabilities for cmp
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {"c", "cpp", "objc", "objcpp"},
        callback = function(args)
            local root_dir = vim.fs.find({"compile_commands.json", ".git"}, { upward = true })[1]
            root_dir = root_dir and vim.fs.dirname(root_dir) or vim.loop.cwd()

            if #vim.lsp.get_clients({ name = "clangd", bufnr = args.buf }) == 0 then
                vim.lsp.start({
                    name = "clangd",
                    cmd = { "clangd", "--background-index" },
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                    capabilities = capabilities,
                    root_dir = root_dir,
                })
            end
        end
    })
end

