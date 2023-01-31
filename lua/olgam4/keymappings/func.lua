local git_commit = function()
  local message = vim.fn.input('Commit message: ')
  if message == '' then
    print('No commit message given. Aborting.')
    return
  end
  vim.api.nvim_command('! git add -A')
  vim.api.nvim_command('! git commit -m \"' .. message .. '\"')
  vim.api.nvim_command('! git push')
end

vim.keymap.set('n', 'gcp', function()
  git_commit()
end)

local change_font_size = function(size)
  local font = vim.api.nvim_get_option('guifont')
  local newFont = string.gsub(font, ':h%d+', ':h' .. size)
  vim.api.nvim_set_option('guifont', newFont)
end

local increase_font_size = function()
  local font = vim.api.nvim_get_option('guifont')
  local size = string.match(font, ':h(%d+)')
  if size then
    local newSize = tonumber(size) + 1
    change_font_size(newSize)
  end
end

local decrease_font_size = function()
  local font = vim.api.nvim_get_option('guifont')
  local size = string.match(font, ':h(%d+)')
  if size then
    local newSize = tonumber(size) - 1
    change_font_size(newSize)
  end
end

vim.keymap.set('n', '+', function()
  increase_font_size()
end)
vim.keymap.set('n', '-', function()
  decrease_font_size()
end)
