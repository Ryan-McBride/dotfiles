" this is for neovim
set ttimeout
set ttimeoutlen=100
set smartcase
set number
set showmatch
set mat=3
set hls
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ignorecase
set backspace=2
set termguicolors
let mapleader=" "

lua << EOF
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/dracula.nvim'
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'lewis6991/gitsigns.nvim'
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      }
  }
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "glepnir/dashboard-nvim"
  use "dense-analysis/ale"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-vsnip"
  use "windwp/nvim-autopairs"
end)
EOF

colorscheme dracula
let g:airline_theme='base16_dracula'
let g:airline#extensions#ale#enabled = 1
let g:dashboard_default_executive='telescope'
set completeopt=menu,menuone,noselect

lua << EOF
require("bufferline").setup{
  options = {
    mode = "tabs",
    show_buffer_close_icons = false,
    show_close_icon = false
  }
}

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
}

require('gitsigns').setup{}

require('nvim-autopairs').setup{}

EOF


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" nvim tree settings
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tre_highlight_opened_files = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
lua << EOF
require'nvim-tree'.setup {}
EOF

nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" ale stuff
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

" nvim-cmp stuff
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['eslint'].setup {
    capabilities = capabilities
  }
EOF
