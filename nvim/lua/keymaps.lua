-- Reference from:
-- https://github.com/rainbowhxch/nvim/blob/f59569e874a8975a6c321b00c74e3554ff904e63/lua/mapping.lua
-- Helper Functions for remapping easily
require("plugins/telescope")
local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {silent = true})
end

local function noremap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true})
end

local function nmap(lhs, rhs) map('n', lhs, rhs) end

local function nnoremap(lhs, rhs) noremap('n', lhs, rhs) end

local function vnoremap(lhs, rhs) noremap('v', lhs, rhs) end

local function xnoremap(lhs, rhs) noremap('x', lhs, rhs) end

local function inoremap(lhs, rhs) noremap('i', lhs, rhs) end

local function tnoremap(lhs, rhs) noremap('t', lhs, rhs) end

-- NVIM Compe Remaps
local function exprnoremap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs,
                            {noremap = true, silent = true, expr = true})
end

local function exprinoremap(lhs, rhs) exprnoremap('i', lhs, rhs) end

exprinoremap('<C-Space>', 'compe#complete()')
exprinoremap('<CR>', 'compe#confirm(\'<CR>\')')
exprinoremap('<C-e>', 'compe#close(\'<C-e>\')')
exprinoremap('<C-f>', 'compe#scroll({ \'delta\': +4 })')
exprinoremap('<C-d>', 'compe#scroll({ \'delta\': -4 })')

-- Map Leader Key to <Space>
nnoremap('<Space>', '<NOP>')
vim.g.mapleader = ' '
nnoremap('<leader>', ':WhichKey \'<Space>\'<CR>')

---== LSP Saga ==---
nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

nnoremap('<leader>ca', ':Lspsaga code_action<CR>')
nnoremap('K', ':Lspsaga hover_doc<CR>')

-- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
nnoremap("<C-N>", ":Lspsaga diagnostic_jump_prev<CR>")
nnoremap("<C-n>", ":Lspsaga diagnostic_jump_next<CR>")
-- scroll down hover doc or scroll in definition preview
nnoremap("<C-k>",
         "<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
nnoremap("<C-j>",
         "<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>")
vim.cmd(
    'command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

vim.cmd(
    ':command ShowCursorError lua require\'lspsaga.diagnostic\'.show_cursor_diagnostics()')
nnoremap("<leader>e", "<cmd>ShowCursorError<CR>")

nnoremap('<leader>cr', ':Lspsaga rename<CR>')
-- =======--

-- Command Line Mapping
vim.cmd(':command SearchFiles lua require(\'telescope.builtin\').git_files()')
vim.cmd(':command Find lua require(\'telescope.builtin\').live_grep()')
vim.cmd(
    ':command SearchVimConfig lua require(\'plugins/telescope\').search_dotfiles()')

-- Toggle explorer
nnoremap('<C-e>', ':NvimTreeToggle<CR>')

-- Toggle Integrated Terminal
-- TODO: Remap to CTRL+` for more VSCode like experience
nnoremap('<leader>t', ':ToggleTerm<Enter>')
tnoremap('<leader>t', '<C-\\><C-n>:ToggleTerm<Enter>')

-- Esc to get out of terminal
tnoremap('<C-\\>', '<C-\\><C-n>')

-- Search Dot files with Telescope
nnoremap('<leader>nvc', ':SearchVimConfig<CR>')

-- ctrl+p to search files
nnoremap('<C-p>', ':SearchFiles<CR>')
nnoremap('<leader>lg', ':Find<CR>')

-- quick fix lists
nnoremap('<leader>qf', ':copen<CR>')
nnoremap('<leader>qj', ':cnext<CR>')
nnoremap('<leader>qk', ':cprevious<CR>')

-- Neogit
nnoremap('<leader>g', ':Neogit<CR>')

-- Prettier
nnoremap("<leader>p", ":lua vim.lsp.buf.formatting()<CR>")

-- Tab switch buffer
nnoremap('<TAB>', ':bnext<CR>')
nnoremap('<S-TAB>', ':bprevious<CR>')

vim.cmd(
    ':command ReloadLuaClient :lua vim.lsp.stop_client(vim.lsp.get_active_clients())')
-- Force Reload the Lua client
nnoremap('<leader>fl', ':ReloadLuaClient<CR>')
-- Force Reload the buffer
nnoremap('<leader>fb', ':edit')

-- Undotree
vim.cmd(':command Undotree :UndotreeShowh<CR>')
nnoremap('<leader>u', ':Undotree<CR>')

-- CTRL+W to close buffer
nnoremap('<C-w>', ':bd<CR>')

-- Remove Highlights 
nmap('<C-l>', ':nohl<CR>')

-- Better Window Movement
nnoremap('<C-h>', ':wincmd h<CR>')
nnoremap('<C-j>', ':wincmd j<CR>')
nnoremap('<C-k>', ':wincmd k<CR>')
nnoremap('<C-l>', ':wincmd l<CR>')

-- alt + hjkl to resize
nnoremap('<M-h>', ':vertical resize -2<CR>')
nnoremap('<M-l>', ':vertical resize +2<CR>')

vim.cmd(':command LeftWindow :wincmd h')
vim.cmd(':command DownWindow :wincmd j')
vim.cmd(':command UpWindow :wincmd k')
vim.cmd(':command RightWindow :wincmd l')

nnoremap('<leader>h', ':LeftWindow<CR>')
nnoremap('<leader>j', ':UpWindow<CR>')
nnoremap('<leader>k', ':DownWindow<CR>')
nnoremap('<leader>l', ':RightWindow<CR>')

-- Alternate way to Save 
nnoremap('<C-s>', ':w<CR>')

-- ctrl+c behaves like Esc
nnoremap('<C-c>', '<Esc>')

-- Better Indenting
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Move selected line / block of text with Alt + j,k 
xnoremap('<A-j>', ':move \'>+1<CR>gv-gv')
xnoremap('<A-k>', ':move \'<-2<CR>gv-gv')

nnoremap('<A-j>', ':m .+1<CR>==')
nnoremap('<A-k>', ':m .-2<CR>==')

inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')

-- Split Window Vertically
nnoremap('<leader>v', ':vsplit<CR>')

