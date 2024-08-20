vim.g.mapleader = ' '


-- vim.keymap.set('n', '<leader>T', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>t', ':Neotree toggle right<CR>')
vim.keymap.set('n', '<leader>r', ':GrugFar<CR>')
vim.keymap.set('n', '<leader>R',
    ":lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%'), search = vim.fn.expand('<cword>') } })<CR>")
-- vim.keymap.set('n', '<leader>o', builtin.find_files)
vim.keymap.set('n', '<leader>o', ":FzfLua files<cr>")
vim.keymap.set('n', '<leader><s-o>', ":lua require('oil').open()<cr>")

vim.keymap.set('n', '<leader>d', ":Diffview")
-- vim.keymap.set('n', '<leader>f', function()
--   builtin.grep_string{
--     path_display = { 'smart' },
--     only_sort_text = true,
--     word_match = "-w",
--     search = '',
--   }
-- end)
-- vim.keymap.set('n', '<leader>f', ":FzfLua live_grep<cr>")
vim.keymap.set('n', '<leader>f', ":lua require('fzf-lua').grep_project()<cr>")
vim.keymap.set('n', '<leader>F', ":FzfLua grep_cword<cr>")
vim.keymap.set('n', '<leader>b', ":FzfLua buffers<cr>")
vim.keymap.set('n', '<leader>h', ":FzfLua helptags<cr>")

-- splits
vim.keymap.set('n', '<C-/>', ':split<CR>', { silent = true })
vim.keymap.set('n', '<C-\'>', ':vsplit<CR>', { silent = true })

-- window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')
vim.keymap.set('n', '<leader>ez', ':e ~/.zshrc<CR>')
vim.keymap.set('n', '<leader>et', ':e ~/.tmux.conf<CR>')
vim.keymap.set('n', '<leader>ee', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>ek', ':e ~/.config/nvim/lua/config/keybinds.lua<CR>')
vim.keymap.set('n', '<leader>ep', ':e ~/.config/nvim/lua/config/lazy.lua<CR>')

vim.keymap.set('n', '<leader><leader>h', ':nohl<CR>')
vim.api.nvim_set_keymap('n', '<leader><leader>w', ':set wrap!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-,>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-.>', ':bnext<CR>', { noremap = true, silent = true })

-- CMP code action
-- vim.api.nvim_set_keymap('n', '<c-,>', ':lua vim.lsp.buf.code_action<CR>', { noremap = true, silent = true })

-- lsp stuff
vim.keymap.set('n', '<leader>lf', ':lua vim.lsp.buf.code_action()<CR>')

-- vim.keymap.set('n', '<leader>ff', ':lua vim.lsp.buf.format()<CR>')




vim.api.nvim_create_user_command("DiagnosticToggle", function()
    local config = vim.diagnostic.config
    local vt = config().virtual_text
    config {
        virtual_text = not vt,
        -- underline = not vt,
        -- signs = not vt,
    }
end, { desc = "toggle diagnostic" })
vim.api.nvim_set_keymap('n', '<leader><leader>l', ':DiagnosticToggle<CR>', { noremap = true, silent = true })


vim.api.nvim_create_user_command("HiddenCharactersToggle", function()
    vim.o.list = not vim.o.list
end, { desc = "toggle rendering of spaces, tabs, etc." })
vim.api.nvim_set_keymap('n', '<leader><leader>c', ':HiddenCharactersToggle<CR>', { noremap = true, silent = true })


-- CREATE NEW NOTE
local function create_new_note()
    local notes_dir = vim.fn.expand("~/notes/")
    if vim.fn.isdirectory(notes_dir) == 0 then
        vim.fn.mkdir(notes_dir, "p")
    end
    local date_format = os.date("%Y%m%d%H%M")
    local file_path = notes_dir .. "/" .. date_format .. ".md"
    vim.cmd("edit " .. file_path)
end
_G.create_new_note = create_new_note
vim.api.nvim_set_keymap('n', '<leader>nn', ':lua create_new_note()<CR>', { noremap = true, silent = true })

-- even better
vim.api.nvim_set_keymap('n', '<leader>en', ':e ~/notes/note.md<cr>', { noremap = true, silent = true })







--
-- -- WINDOW RESIZE mode
-- -- Define a global variable to track the window mode state
-- _G.window_mode_active = false
--
-- -- Function to toggle window resize mode
-- function ToggleWindowResizeMode()
--     if _G.window_mode_active then
--         _G.window_mode_active = false
--         print("Exited Window Resize Mode")
--     else
--         _G.window_mode_active = true
--         print("Entered Window Resize Mode")
--     end
-- end
--
-- -- Keybinding to enter window resizing mode with <Space>W
-- vim.keymap.set('n', '<Space>w', function() ToggleWindowResizeMode() end)
--
-- -- Conditional mappings for window resizing
-- vim.keymap.set('n', 'k', function()
--     if _G.window_mode_active then
--         vim.cmd('resize -2')
--     else
--         vim.cmd('normal! h')
--     end
-- end, { silent = true })
--
-- vim.keymap.set('n', 'j', function()
--     if _G.window_mode_active then
--         vim.cmd('resize +2')
--     else
--         vim.cmd('normal! j')
--     end
-- end, { silent = true })
--
-- vim.keymap.set('n', 'h', function()
--     if _G.window_mode_active then
--         vim.cmd('vertical resize +2')
--     else
--         vim.cmd('normal! k')
--     end
-- end, { silent = true })
--
-- vim.keymap.set('n', 'l', function()
--     if _G.window_mode_active then
--         vim.cmd('vertical resize -2')
--     else
--         vim.cmd('normal! l')
--     end
-- end, { silent = true })
--
-- -- Exit window resizing mode with <Esc>
-- vim.keymap.set('n', '<Esc>', function()
--     if _G.window_mode_active then
--         _G.window_mode_active = false
--         print("Exited Window Resize Mode")
--     else
--         vim.cmd('normal! <Esc>')
--     end
-- end, { silent = true })
