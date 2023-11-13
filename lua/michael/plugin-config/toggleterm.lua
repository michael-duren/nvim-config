require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
        border = "Normal",
        background = "Normal",
        },
    },
}

for i = 1, 5 do
    vim.keymap.set('t', '<C-'..i..'>', function()
        require("toggleterm").exec_command("ToggleTerm"..i)
    end, {noremap = true, silent = true})
end
