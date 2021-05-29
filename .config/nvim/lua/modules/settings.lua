local cmd = vim.api.nvim_command

local apply_options = function(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd('set ' .. k)
    elseif v == false then
      cmd(string.format('set no%s', k))
    else
      cmd(string.format('set %s=%s', k, v))
    end
  end
end

local options = {
  backspace = "indent,eol,start",
  mouse = "a",
  laststatus = 0,
  textwidth = 100,
  incsearch = true,
  hlsearch = true,
  number = true,
  spell = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  nojoinspaces = true,
  cursorline = true
}

apply_options(options)
