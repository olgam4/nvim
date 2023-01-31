vim.keymap.set('n', '<leader>tq', ':lua require("harpoon.term").gotoTerminal(0)<cr>')
vim.keymap.set('n', '<leader>tw', ':lua require("harpoon.term").gotoTerminal(1)<cr>')
vim.keymap.set('n', '<leader>te', ':lua require("harpoon.term").gotoTerminal(2)<cr>')
vim.keymap.set('n', '<leader>tr', ':lua require("harpoon.term").gotoTerminal(3)<cr>')
vim.keymap.set('n', '<leader>t1', ':lua require("harpoon.ui").nav_file(1)<cr>')
vim.keymap.set('n', '<leader>t2', ':lua require("harpoon.ui").nav_file(2)<cr>')
vim.keymap.set('n', '<leader>t3', ':lua require("harpoon.ui").nav_file(3)<cr>')
vim.keymap.set('n', '<leader>t4', ':lua require("harpoon.ui").nav_file(4)<cr>')
vim.keymap.set('n', '<leader>ta', ':lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set('n', '<leader>ts', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set('n', '<leader>marks', ':Telescope harpoon marks<cr>')


