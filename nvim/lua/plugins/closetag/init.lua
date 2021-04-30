-- Autoclose Tags --
vim.api.nvim_set_var('closetag_filenames',
                     '*.html,*.xhtml,*.phtml, *.jsx, *.js, *.tsx')
vim.api.nvim_set_var('closetag_xhtml_filenames', '*.xhtml,*.jsx, *.tsx, *.js')
vim.api.nvim_set_var('closetag_filetypes', 'html,xhtml,phtml')
vim.api.nvim_set_var('closetag_xhtml_filetypes', 'xhtml,jsx')
vim.api.nvim_set_var('closetag_emptyTags_caseSensitive', 1)
vim.api.nvim_set_var('closetag_shortcut', '>')

