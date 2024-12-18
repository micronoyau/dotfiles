-- Supported LSP servers
require("mason").setup()
local lspconfig = require('lspconfig')
require("mason-lspconfig").setup {
    ensure_installed = {
        'awk_ls',
        'bashls',
        'clangd',
        'docker_compose_language_service',
        'dockerls',
        'gradle_ls',
        'html',
        'jdtls',
        'jsonls',
        'lua_ls',
        'marksman',
        'pylsp',
        'pyright',
        'rust_analyzer',
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup {}
        end
    }
}

-- Language-specific
lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    }
}

-- LSP Keymaps
local s = vim.keymap.set

s("n", "<leader>ll", ":lua vim.lsp.buf.hover()<cr>:lua vim.lsp.buf.hover()<cr>")
s("n", "<leader>lhh", ":lua vim.lsp.buf.document_highlight()<cr>")
s("n", "<leader>lhc", ":lua vim.lsp.buf.clear_references()<cr>")
s("n", "<leader>ld", ":lua vim.lsp.buf.definition()<cr>")
s("n", "<leader>lx", ":lua vim.lsp.buf.references()<cr>")
s("n", "<leader>lr", ":lua vim.lsp.buf.rename()<cr>")
s("n", "<leader>l=", ":lua vim.lsp.buf.format()<cr>")
s("n", "<leader>lt", ":lua vim.lsp.buf.type_definition()<cr>")
s("n", "<leader>li", ":lua vim.lsp.buf.incoming_calls()<cr>")
s("n", "<leader>lf", ":lua vim.diagnostic.open_float()<cr>:lua vim.diagnostic.open_float()<cr>")
s("n", "<leader>lDh", ":lua vim.diagnostic.hide()<cr>")
s("n", "<leader>lDs", ":lua vim.diagnostic.show()<cr>")
s("n", "<leader>lsa", ":LspStart<cr>")
s("n", "<leader>lso", ":LspStop<cr>")

-- Autocompletion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
    completion = {
        autocomplete = false
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },

    mapping = ({
        ['<C-Space>'] = function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end,
        ['<cr>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item()
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 1 },
        -- { name = 'luasnip', keyword_length=2 },
        { name = 'buffer',   keyword_length = 3 }
    }),

    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}
