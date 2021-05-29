vim.g.python3_host_prog = "/usr/bin/python3"

vim.cmd("cd %:p:h")

require("plugins.packer")

require("modules.settings")
require("modules.appearances")
require("modules.mappings")

require("plugins.tree")
require("plugins.treesitter")
require("plugins.commentary")
require("plugins.comfortable_motion")

require('nvim_comment').setup()
