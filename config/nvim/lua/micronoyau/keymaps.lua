local s = vim.keymap.set

s('n', '<C-l>', '<c-w>l')
s('n', '<C-h>', '<c-w>h')
s('n', '<C-j>', '<c-w>j')
s('n', '<C-k>', '<c-w>k')

s('n', '<leader>ee', ':Neotree toggle<cr>')
s('n', '<leader>ef', ':Neotree focus<cr>')

s('n', '<leader>bf', ':Telescope buffers<cr>')
s('n', '<leader>ff', ':Telescope live_grep<cr>')

s('n', '<leader>+', ':resize +10<cr>')
s('n', '<leader>-', ':resize -10<cr>')
s('n', '<leader>>', ':vertical resize +10<cr>')
s('n', '<leader><', ':vertical resize -10<cr>')
s('n', '<leader>=', '<c-w>=')

s('n', '<leader>s', ':vs<cr>')
s('n', '<leader>S', ':sp<cr>')
s('n', '<leader>fs', ':tab split<cr>')

s('n', '<leader>y', '\"+y')
s('v', '<leader>y', '\"+y')
s('n', '<leader>p', '\"+p')

s('n', '<leader>t2', ':set shiftwidth=2<cr>:set tabstop=2<cr>')
s('n', '<leader>t4', ':set shiftwidth=4<cr>:set tabstop=4<cr>')

s('n', '<leader>tt', ':ToggleTerm direction=horizontal<cr>')
s('t', '<Esc>', '<c-\\><c-n>')

s('n', '<leader>hd', ':HexDump<cr>')
s('n', '<leader>ha', ':HexAssemble<cr>')

s('n', '<leader>ma', ':lua require("harpoon"):list():add()<cr>')
s('n', '<leader>mm', ':lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<cr>')
s('n', '<leader>mf', ':Telescope harpoon marks<cr>')
s('n', '<leader><tab>', ':lua require("harpoon"):list():next()<cr>')
s('n', '<leader><S-tab>', ':lua require("harpoon"):list():prev()<cr>')
s('n', '<leader>m1', ':lua require("harpoon"):list():select(1)<cr>')
s('n', '<leader>m2', ':lua require("harpoon"):list():select(2)<cr>')
s('n', '<leader>m3', ':lua require("harpoon"):list():select(3)<cr>')
s('n', '<leader>m4', ':lua require("harpoon"):list():select(4)<cr>')
s('n', '<leader>m5', ':lua require("harpoon"):list():select(5)<cr>')
s('n', '<leader>m6', ':lua require("harpoon"):list():select(6)<cr>')
s('n', '<leader>m7', ':lua require("harpoon"):list():select(7)<cr>')
s('n', '<leader>m8', ':lua require("harpoon"):list():select(8)<cr>')
s('n', '<leader>m9', ':lua require("harpoon"):list():select(9)<cr>')

s('n', '<leader>mp', ':MarkdownPreview<cr>')

s('n', '<leader>gp', ':Gitsigns preview_hunk_inline<cr>')
s('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<cr>')
s('n', '<leader>gb', ':Git blame<cr>')
s('n', '<leader>ga', ':Git add %<cr>')
s('n', '<leader>gs', ':Git status<cr>')
s('n', '<leader>gc', ':Git commit<cr>')
s('n', '<leader>gl', ':Flogsplit<cr>')
s('n', '<leader>gd', ':Git diff %<cr>')
