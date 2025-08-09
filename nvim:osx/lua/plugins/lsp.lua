return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "pyright" },
    }

    local lspconfig = require("lspconfig")
    local caps = require("cmp_nvim_lsp").default_capabilities()
  end
}
