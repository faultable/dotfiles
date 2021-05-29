vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if ok then
  local use = packer.use

  packer.init()

  local plugins = function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'nvim-treesitter/nvim-treesitter', opt = true }
    use { 'kyazdani42/nvim-tree.lua', opt = true }
    use { 'joshdick/onedark.vim', opt = true }
    use { 'yuttie/comfortable-motion.vim', opt = true }
    use { 'tpope/vim-commentary', opt = true }
    use { 'terryma/vim-multiple-cursors', opt = true }
    use { 'nvim-telescope/telescope.nvim', opt = true, requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }}
    use { "terrortylor/nvim-comment", opt = true }
  end

  return packer.startup(plugins)
end

