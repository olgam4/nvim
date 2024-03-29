vim.keymap.set('n', '<space>,', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<space>;', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
