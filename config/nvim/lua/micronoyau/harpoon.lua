local harpoon = require('harpoon')

-- Credits to @https://github.com/ThePrimeagen/harpoon/issues/352
local yellow = '#DCDCAA'
local yellow_orange = '#D7BA7D'
local background_color = "#282829"
local grey = "#797C91"
local light_blue = "#9CDCFE"
vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = grey, bg = background_color })
vim.api.nvim_set_hl(0, "HarpoonActive", { fg = light_blue, bg = background_color })
vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = yellow, bg = background_color })
vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = yellow_orange, bg = background_color })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = "white", bg = background_color })

function Harpoon_files()
    local contents = {}
    local marks_length = harpoon:list():length()
    local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
    for index = 1, marks_length do
        local harpoon_file_path = harpoon:list():get(index).value
        local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ':t')

        if current_file_path == harpoon_file_path then
            contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
        else
            contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, file_name)
        end
    end

    return table.concat(contents)
end

vim.opt.showtabline = 2
vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "User" }, {
    callback = function(_)
        vim.o.tabline = Harpoon_files()
    end
})
