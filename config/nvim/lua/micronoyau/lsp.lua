local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}

local s = vim.keymap.set

s("n", "<leader>lh", ":lua vim.lsp.buf.hover()<cr>")
s("n", "<leader>lgd", ":lua vim.lsp.buf.declaration()<cr>")

-- s("n", "<leader>lgi", ":lua vim.lsp.buf.implementation()<cr>")
-- nnoremap <buffer> gd <cmd>lua vim.lsp.buf.definition()<cr>
-- nnoremap <buffer> gD <cmd>lua vim.lsp.buf.declaration()<cr>
-- nnoremap <buffer> gi <cmd>lua vim.lsp.buf.implementation()<cr>
-- nnoremap <buffer> go <cmd>lua vim.lsp.buf.type_definition()<cr>
-- nnoremap <buffer> gr <cmd>lua vim.lsp.buf.references()<cr>
-- nnoremap <buffer> <C-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
-- nnoremap <buffer> <F2> <cmd>lua vim.lsp.buf.rename()<cr>
-- nnoremap <buffer> <F4> <cmd>lua vim.lsp.buf.code_action()<cr>
-- xnoremap <buffer> <F4> <cmd>lua vim.lsp.buf.range_code_action()<cr>
--
-- nnoremap <buffer> gl <cmd>lua vim.diagnostic.open_float()<cr>
-- nnoremap <buffer> [d <cmd>lua vim.diagnostic.goto_prev()<cr>
-- nnoremap <buffer> ]d <cmd>lua vim.diagnostic.goto_next()<cr>
