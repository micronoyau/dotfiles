local lspconfig = require('lspconfig')
-- lspconfig.clangd.setup {}

local s = vim.keymap.set

s("n", "<leader>l?", ":lua vim.lsp.buf.hover()<cr>")
s("n", "<leader>lhh", ":lua vim.lsp.buf.document_highlight()<cr>")
s("n", "<leader>lhc", ":lua vim.lsp.buf.clear_references()<cr>")
s("n", "<leader>ld", ":lua vim.lsp.buf.definition()<cr>")
s("n", "<leader>lx", ":lua vim.lsp.buf.references()<cr>")
s("n", "<leader>lr", ":lua vim.lsp.buf.rename()<cr>")
s("n", "<leader>lt", ":lua vim.lsp.buf.type_definition()<cr>")
s("n", "<leader>li", ":lua vim.lsp.buf.incoming_calls()<cr>")

-- s("n", "<leader>lwa", ":lua vim.lsp.buf.add_workspace_folder()<cr>")
-- s("n", "<leader>li", ":lua vim.lsp.buf.implementation()<cr>")
