require("config.lazy")
require('mini.surround').setup()
vim.cmd([[colorscheme ash]])
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
local snippets = require("plugins.luasnip")
