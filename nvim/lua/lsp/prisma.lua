-- TODO: Figure out why this is not working!
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
-- Check if it's already defined for when reloading this file.
if not lspconfig.prisma_lsp then
    configs.prisma_lsp = {
        default_config = {
            cmd = {'prisma-language-server', '--stdio'},
            filetypes = {'prisma'},
            root_dir = function(fname)
                return lspconfig.util.root_pattern(".git")(fname);
            end,
            settings = {}
        }
    }
end

lspconfig.prisma_lsp.setup {}
