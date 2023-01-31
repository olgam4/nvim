-- LEADERS
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- EASIER MARKS
-- marks current cursor to [asdf]
vim.keymap.set('n', 'ma', 'mA')
vim.keymap.set('n', 'ms', 'mS')
vim.keymap.set('n', 'md', 'mD')
vim.keymap.set('n', 'mf', 'mF')
-- jump to marks in [asdf]
vim.keymap.set('n', '\'a', '\'A')
vim.keymap.set('n', '\'s', '\'S')
vim.keymap.set('n', '\'d', '\'D')
vim.keymap.set('n', '\'f', '\'F')

-- PANES
-- move through panes withouth first <c-w>
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
-- open panes
vim.keymap.set('n', 'gvp', '<cmd>vsp<cr><c-w><c-l>')
vim.keymap.set('n', 'ghp', '<cmd>sp<cr><c-w><c-j>')

-- TABS
-- open tab
vim.keymap.set('n', '<leader>tt', '<cr><cmd>tab split<cr>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabc<cr>')

-- QUALITY OF LIFE
-- delete to null
vim.keymap.set('n', '<leader>d', '\'_d')
vim.keymap.set('v', '<leader>d', '\'_d')
-- better indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
-- remove last search highlight
vim.keymap.set('n', '<esc>', '<cmd>noh<return><esc>')
-- yank to the end of the liue
vim.keymap.set('n', 'Y', 'y$')
-- let undo go to last 'poncutation'
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '[', '[<c-g>u')
vim.keymap.set('i', ']', ']<c-g>u')
vim.keymap.set('i', '{', '{<c-g>u')
vim.keymap.set('i', '}', '}<c-g>u')
vim.keymap.set('i', '(', '(<c-g>u')
vim.keymap.set('i', ')', ')<c-g>u')
-- quick moving
vim.keymap.set('n', 'J', '5j')
vim.keymap.set('v', 'J', '5j')
vim.keymap.set('n', 'K', '5k')
vim.keymap.set('v', 'K', '5k')
vim.keymap.set('n', '<leader>j', 'mpJ\'p')

-- close
vim.keymap.set('n', '<D-w>', ':wqa<cr>')
-- copy paste from clipboard
vim.keymap.set('n', '<D-v>', '"*p')
vim.keymap.set('i', '<D-v>', '<esc>"*pa')
vim.keymap.set('v', '<D-c>', '"*y')

require('olgam4.keymappings.func')

require('olgam4.keymappings.plugin.gitblame')
require('olgam4.keymappings.plugin.harpoon')
require('olgam4.keymappings.plugin.leap')
require('olgam4.keymappings.plugin.lsp')
require('olgam4.keymappings.plugin.nvim-tree')
require('olgam4.keymappings.plugin.refactoring')
require('olgam4.keymappings.plugin.telescope')
require('olgam4.keymappings.plugin.todo')
require('olgam4.keymappings.plugin.undotree')
require('olgam4.keymappings.plugin.visual')
require('olgam4.keymappings.plugin.cellular')
