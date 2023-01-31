local lsp = require 'lsp-zero'

lsp.preset 'recommended'

lsp.configure('sumneko_lua', {
  diagnostics = {
    globals = {
      'vim'
    }
  }
})

lsp.configure('rust-analyzer', {
  checkOnSave = {
    allFeatures = true,
    overrideCommand = {
      'cargo', 'clippy', '--workspace', '--message-format=json',
      '--all-targets', '--all-features'
    }
  }
})

lsp.nvim_workspace {}

lsp.set_preferences {
  set_lsp_keymaps = { omit = { '<C-k>', 'K' } }
}

lsp.setup {}
