vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.updatetime = 50
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.cmd [[ set nocompatible ]]
vim.cmd [[ set formatoptions-=o ]]

vim.g.gitblame_enabled = 0
vim.cmd [[ let g:neovide_input_use_logo = v:true ]]

local rt = require 'rust-tools'
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
