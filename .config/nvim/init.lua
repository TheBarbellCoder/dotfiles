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

-- Add Python to nvim runtime path

g["python2_host_prog"] = "/usr/bin/python2"
g["python3_host_prog"] = "/usr/bin/python3"

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
opt.completeopt = {"menuone", "noinsert"}

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
    "Shougo/deoplete.nvim";
    "Shougo/deoplete-clangx";
    "neovim/nvim-lspconfig";
    {"nvim-treesitter/nvim-treesitter"}
}

-- Setup LSP

require "lspconfig".pylsp.setup{}
require "lspconfig".clangd.setup{}

-- Setup TreeSitter

require "nvim-treesitter.configs".setup{
    highlight = {enable = true,
--        disable = {"python"},
        additional_vim_regex_highlighting = python
    },
}

require "nvim-treesitter.install".compilers = { "gcc" }

-- Setup Deoplete

g["deoplete#enable_at_startup"] = "1"
