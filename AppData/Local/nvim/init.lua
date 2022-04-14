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
opt.completeopt = {"menuone", "noinsert"}

cmd [[
set formatoptions+=t
set formatoptions-=l
filetype plugin indent on
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
    "Shougo/deoplete.nvim";
    "windwp/nvim-autopairs";
    "neovim/nvim-lspconfig";
    "Shougo/deoplete-clangx";
    "NLKNguyen/papercolor-theme"
}

-- Setup LSP

require "lspconfig".pylsp.setup{}
require "lspconfig".clangd.setup{
    cmd = { "clangd", "--background-index", "--suggest-missing-includes"},
    filetypes = {"c", "cpp", "cxx", "h", "hpp"},
}

cmd[[
call deoplete#custom#var('clangx', 'clang_binary', 'C:\Tools\llvm\bin')
]]

-- Setup Auto-pairs

require "nvim-autopairs".setup{}

-- Setup UltiSnips

g["UltiSnipsExpandTrigger"] = "<tab>"
g["UltiSnipsJumpForwardTrigger"] = "<c-f>"
g["UltiSnipsJumpBackwardTrigger"] = "<c-b>"
g["UltiSnipsSnippetDirectories"] = {"MieleSnips"}
g["UltiSnipsSnippetsDir"] = "C:/Users/derav/AppData/Local/nvim/MieleSnips"
