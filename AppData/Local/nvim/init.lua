local fn = vim.fn
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Install paq-nvim package manager if not already installed

local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth=1",
    "http://github.com/savq/paq-nvim.git", install_path})
end

-- Add Python3 to nvim runtime path

g["python3_host_program"] = "C:/DevApps/Miniconda3/python.exe"

-- Editor settings

opt.list = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.listchars = "tab:>-,trail:~,space:.,eol:<,extends:>"

opt.hlsearch = true
opt.smartcase = true

opt.wrap = true
opt.whichwrap = "b,s,<,>,[,]"

opt.linebreak = true
opt.showbreak = "+++ "
opt.breakindent = true
opt.autoindent = true

opt.clipboard = "unnamedplus"

opt.number = true
opt.colorcolumn = '80'
opt.relativenumber = true
opt.completeopt = {"menuone", "noinsert", "noselect"}

cmd [[ set formatoptions+=t
set formatoptions-=l
]]

cmd [[
augroup general
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END
]]

-- Nvim packages

require "paq"{
    "savq/paq-nvim";
    "SirVer/ultisnips";
    "neovim/nvim-lspconfig";
    "nvim-lua/completion-nvim";
    "nvim-treesitter/nvim-treesitter"
}

-- Setup LSP

require "lspconfig".pylsp.setup{on_attach=require'completion'.on_attach}
require "lspconfig".ccls.setup{on_attach=require'completion'.on_attach}

-- Setup TreeSitter

require "nvim-treesitter.configs".setup{
    highlight = {enable = true,
--        disable = {"python"},
        additional_vim_regex_highlighting = python
    },
    indent = {enable = true}
}
require "nvim-treesitter.install".compilers = { "cl" }

-- Setup Completion-Nvim
g["completion_enable_snippet"] = "UltiSnips"

-- Setup UltiSnips
g["UltiSnipsExpandTrigger"] = "<tab>"
g["UltiSnipsJumpForwardTrigger"] = "<c-f>"
g["UltiSnipsJumpBackwardTrigger"] = "<c-b>"
g["UltiSnipsSnippetDirectories"] = {"MieleSnips"}
g["UltiSnipsSnippetsDir"] = "C:/Users/derav/AppData/Local/nvim/MieleSnips"
