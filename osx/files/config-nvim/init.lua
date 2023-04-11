-- general vim settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.ruler = true
vim.opt.smarttab = true
vim.g.noswapfile = true
vim.g.nobackup = true
vim.g.mapleader = ' '

-- remaps
local map = require('utils').map
map('n', '<Leader>f', ":ALEFix<CR>")

-- plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'mattn/emmet-vim'
  use 'lewis6991/gitsigns.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'norcalli/nvim-colorizer.lua'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  use 'joshdick/onedark.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'dense-analysis/ale'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  } 

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

-- plugin settings
vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')
-- ale
vim.api.nvim_exec([[
  let g:ale_javascript_eslint_executable = 'eslint_d'
]], false)

vim.api.nvim_exec([[
  let g:ale_javascript_eslint_use_global = 1
]], false)

vim.api.nvim_exec([[
  let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'javascriptreact': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'typescriptreact': ['eslint'],
    \ 'json': ['jq'],
  \}
]], false)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- nvim-tree
require('nvim-tree').setup({
  view = {
    width = 40,
    mappings = {
      list = {
        {
          key = 'u',
          action = 'dir_up'
        },
        {
          key = 't',
          action = 'tabnew'
        }
      }
    }
  }
})
map('n', '<leader>t', ':NvimTreeToggle<CR>')
-- indent blankline
require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = true,
}
-- colorizer
require'colorizer'.setup()
-- gitsigns
require('gitsigns').setup()
