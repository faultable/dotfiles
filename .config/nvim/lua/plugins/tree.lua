vim.cmd[[packadd nvim-tree.lua]]

vim.g.nvim_tree_side = 'left'

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width = 20
vim.g.nvim_tree_ignore = { '__pycache__', '.git', 'node_modules', '.cache' }

vim.g.nvim_tree_icons = {
   git = {
     unstaged = "✗",
     staged = "✓",
     unmerged = "x",
     renamed = "➜",
     untracked = "★"
   },
}

vim.g.nvim_tree_show_icons = {
   git = 1,
   folders = 0,
   files = 0,
}
