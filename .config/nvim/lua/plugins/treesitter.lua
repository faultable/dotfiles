vim.cmd[[packadd nvim-treesitter]]

local ts_config = require("nvim-treesitter.configs")
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

ts_config.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "jsdoc",
    "json",
    "html",
    "css",
    "graphql",
    "rust",
    "tsx",
    "cpp",
    "bash",
    "python",
    "lua",
    "yaml",
    "toml",
    "go",
    "query",
    "ruby"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    lsp_interop = {
      enable = true,
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false
  },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}

