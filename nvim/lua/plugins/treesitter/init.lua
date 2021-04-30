require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- TODO seems to be broken
    ignore_install = {"haskell"},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    indent = {enable = true},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    autotag = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "vi",
            node_incremental = "n",
            scope_incremental = "s",
            node_decremental = "nd"
        }
    },
    rainbow = {enable = true}
    -- refactor = {highlight_definitions = {enable = true}}
}

