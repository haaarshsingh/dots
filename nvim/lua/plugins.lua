local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
    execute 'packadd packer.nvim'
end
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Appearence
    use 'joshdick/onedark.vim' -- OneDark Color Theme
    use 'kyazdani42/nvim-tree.lua' -- Explorer
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use 'glepnir/dashboard-nvim' -- Dashboard for Neovim
		use 'romgrk/barbar.nvim' -- VSC tab bar

    use 'kyazdani42/nvim-web-devicons' -- Devicons for Plugins
    use 'ryanoasis/vim-devicons'

    -- Web Dev
    use 'gennaro-tedesco/nvim-jqx'
    use 'alvan/vim-closetag'
    use 'styled-components/vim-styled-components'
    use 'jparise/vim-graphql'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Language Server Protocol Config
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim' -- Better icons for autcomplete
    use 'kosayoda/nvim-lightbulb'
    use 'anott03/nvim-lspinstall'

    -- Autcomplete
    use 'hrsh7th/nvim-compe' -- Autocompletion
    use 'mattn/emmet-vim'
    use 'xabikos/vscode-javascript'
    use 'dsznajder/vscode-es7-javascript-react-snippets'
    use 'golang/vscode-go'
    use 'rust-lang/vscode-rust'
    -- use 'cohama/lexima.vim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim' -- Telescope: Searching  
    use 'akinsho/nvim-toggleterm.lua' -- Terminal for Neovim
    use 'nvim-lua/popup.nvim' -- Neovim Popup API
    use 'nvim-lua/plenary.nvim' -- Functions you don't wanna write again
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- Snippets
    use 'hrsh7th/vim-vsnip' -- Snipper Integration for Neovim
    use 'hrsh7th/vim-vsnip-integ'

    -- General
    use 'liuchengxu/vim-which-key' -- Which Key
    use 'kevinhwang91/nvim-bqf'
    use 'airblade/vim-rooter'
    use 'voldikss/vim-floaterm'
    use 'liuchengxu/vista.vim'
    use 'b3nj5m1n/kommentary'
    use 'bfredl/nvim-miniyank'
    use 'andymass/vim-matchup' -- Better %
    use 'MattesGroeger/vim-bookmarks'
    use 'wakatime/vim-wakatime' -- Wakatime code tracking

		use 'neoclide/coc.nvim'

    use 'TimUntersberger/neogit' -- Git integration for Neovim
    use 'mbbill/undotree' -- Undotree to undo stuff well
    use 'moll/vim-bbye' -- Better Tab Closing; Incompat. with Barbar
    use 'windwp/nvim-autopairs'
    use 'andweeb/presence.nvim' -- Show which file you're editing in Discord

    -- Tool Specific
    use 'pantharshit00/vim-prisma'

end)

