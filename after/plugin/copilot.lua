local node_path = '~/.nvm/versions/node/v17.9.1/bin/node';
vim.g['copilot_node_command'] = node_path;
vim.g['copilot_assume_mapped'] = true
vim.g['copilot_no_tab_map'] = true
vim.api.nvim_set_keymap('i', 'jk', 'copilot#Accept("<CR>")', {
  silent = true,
  expr = true,
})
