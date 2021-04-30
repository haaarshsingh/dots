vim.wo.number = true -- set numbered lines
vim.cmd('set number') -- Relative Line Numbers
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set noerrorbells') -- No Error Bells
vim.cmd('set smartcase') -- Smartcase: in one uppercase char then search is case sensitive 
vim.cmd('set noswapfile') -- Noswapfile: in one uppercase char then search is case sensitive 
vim.cmd('set undofile') -- Persistent Undo
vim.cmd('set incsearch') -- Incremental Search: Search as you type
vim.cmd('set autoindent') -- Auto Indent
vim.cmd('set nohlsearch') -- No Highlight Search 
vim.cmd('set nobackup') -- No no backup 
vim.cmd('set nowritebackup') -- No Write Backup 
vim.o.hidden = true -- Required to keep multiple buffers open 
vim.wo.wrap = true -- Display long lines as multiple 
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.scrolloff = 8 -- Scroll Offset of 8 lines
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = "a" -- Enable your mouse
vim.o.backupcopy = "yes" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=2') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.cmd('set colorcolumn=99999') -- Fix Vim Indentline 

vim.cmd("filetype plugin on") -- Auto Indentation Levels 
vim.cmd("filetype indent off") -- Auto Indentation Levels
