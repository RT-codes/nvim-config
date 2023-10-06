

vim.g.mapleader = " "
vim.g.confirmKey = "<Meta>"
vim.cmd("set nocompatible")
vim.opt.textwidth = 800
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "v"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = "longest,list"
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.cmd("set ttyfast")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup({
    "flazz/vim-colorschemes",
    "folke/tokyonight.nvim",
    "github/copilot.vim",
    "ryanoasis/vim-devicons",
    "SirVer/ultisnips",
    "honza/vim-snippets",
    "scrooloose/nerdtree",
    "preservim/nerdcommenter",
    "mhinz/vim-startify",
--    "dense-analysis/ale",
    "sbdchd/neoformat" ,
    'fedepujol/move.nvim',
    'nvim-lua/plenary.nvim',
    'ThePrimeagen/harpoon',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', tag = '0.1.3',


    {'hrsh7th/nvim-cmp', event = 'InsertEnter'},
    {'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'},
    {'hrsh7th/cmp-buffer', event = 'InsertEnter'},
    {'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
    {'hrsh7th/vim-vsnip', event = 'InsertEnter'},
    {'onsails/lspkind-nvim', event = 'InsertEnter'},

--    "williamboman/mason.nvim",
--    "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",



})


-- ---------------- lspconfig -----------------------------

require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.lua_ls.setup{}


-- ------------------- LSP -------------------------------
--require("mason").setup()
--require("mason-lspconfig").setup({
--})

--require("mason").setup({
--    plugins = {
--        -- other plugins
--        "dense-analysis/ale",
--    },
--    linters = {
--        -- other linter
--        "luacheck",
--        "pyls",
--    },
--})


-- ------------------- Colorscheme -----------------------
vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme tokyonight")

-- -------- set transparent background for nvim ----------
vim.cmd("highlight Normal ctermbg=none")

-- ------------------- Plugin Settings -------------------

-- ------------------- turn perl off ---------------------------

vim.cmd("let g:loaded_perl_provider = 0")

-- ------------------- Ale -------------------------------

--require'lspconfig'.pyright.setup{}
--require'ale'.setup()
--:ALEGoToDefinition
--:ALEHover
--vim.g.ale_linters = {
--    python = {'jedi_language_server'},
--    lua = {'lua_ls'},
--}
--vim.cmd("let b:ale_linters = {'python': ['jedi_language_server'], 'lua': ['lua_ls']}")

--vim.g.ale_linters = { lua = {'lua-language-server'} }
--vim.g.ale_disable_lsp = 0
--vim.g.ale_set_signs = 1
--print(vim.inspect(vim.g.ale_linters))
--vim.g.ale_linters = { python = {'jedi_language_server'}, lua = {'lua_ls'} }
--vim.g.ale_linters_explicit = 1
--vim.g.ale_completion_enabled = 1

--vim.g.ale_lint_on_text_changed = 'always'
--vim.g.ale_lint_on_save = 1
--vim.api.nvim_set_keymap('n', '<leader>gd<CR>', ':ALEGoToDefinition -vsplit<CR>', {})
--vim.api.nvim_set_keymap('n', '<leader>gh<CR>', ':ALEHover<CR>', {})


--vim.cmd(":ALEGoToDefinition -vsplit")
--:ALEGoToTypeDefinition
--:ALEGoToReferences
--:ALEGoToImplementation

-- ------------------- Telescope -------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- ------------------- NerdTree --------------------------
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', {})
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', {})
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', {})

-- ------------------- Neoformat -------------------------
vim.api.nvim_set_keymap('n', '<leader>f', ':Neoformat<CR>', {})

-- ------------------- Move ------------------------------
vim.api.nvim_set_keymap('n', '<C-j>', ':MoveLine(1)<CR>', {})
vim.api.nvim_set_keymap('n', '<C-k>', ':MoveLine(-1)<CR>', {})
vim.api.nvim_set_keymap('v', '<C-j>', ':MoveBlock(1)<CR>', {})
vim.api.nvim_set_keymap('v', '<C-k>', ':MoveBlock(-1)<CR>', {})

-- ------------------- linting options -------------------

vim.g.ale_python_flake8_options = '--max-line-length=800'
--vim.api.nvim_set_var('ale_virtualtext_cursor', 'current')
--vim.api.nvim_set_var('ale_completion_enabled', 0)
--vim.g.ale_virtualtext_cursor = 'disabled'

--require("coc-config")

-- ------------------- Harpoon ---------------------------
vim.api.nvim_set_keymap('n', '<leader>ht', [[<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hm', [[<cmd>lua require('harpoon.mark').add_file()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hl', [[<cmd>lua require('harpoon.ui').nav_next()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', [[<cmd>lua require('harpoon.ui').nav_prev()<CR>]], { noremap = true, silent = true })

function harpoon_nav_file()
    local nr = vim.fn.input('Enter file number: ')
    if nr ~= '' then
        require('harpoon.ui').nav_file(tonumber(nr))
    end
end

vim.api.nvim_set_keymap('n', '<leader>hn', [[:lua harpoon_nav_file()<CR>]], { noremap = true, silent = true })


vim.g.harpoon_global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    tmux_autoclose_windows = false,
    excluded_filetypes = { "harpoon" },
    mark_branch = false,
    tabline = true,
    tabline_prefix = "-> ",
    tabline_suffix = " <- ",
}

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

-- ------------------- cmp options -----------------------
vim.o.completeopt = "menuone,noselect"

require('lspkind').init({
        mode = 'symbol_text',
        preset = 'default',
        symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
        },
})


local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'vsnip' },
    -- more sources can be added here
  },
  formatting = {
    format = require('lspkind').cmp_format({with_text = true, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      vsnip = "[Snippet]",
    })}),
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local servers = { 'jedi_language_server' }

-- -------------------- Deoplete -------------------------
--vim.g.deoplete_enable_at_startup = 1
--vim.cmd("highlight Pmenu ctermbg=8 guibg=#3b3a3b")
--vim.cmd("highlight PmenuSel ctermbg=1 guifg=#d7d787 guibg=#1f82cd")
--vim.cmd("highlight PmenuSbar ctermbg=0 guibg=#fd2b56")

