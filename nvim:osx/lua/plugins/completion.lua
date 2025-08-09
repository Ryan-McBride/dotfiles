return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",

    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" }, -- I think this gives me way too many snippeets I should just make my own
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
          include = { "javascript", "typescript", "typescriptreact", "python" },
        })
        end,
      },

      "saadparwaiz1/cmp_luasnip",
    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"]   = cmp.mapping.confirm({ select = true }),
          ["<C-l>"]  = cmp.mapping.complete(),
          ["<C-s>"] = function()
            cmp.complete({
              config = {
                sources = { { name = "luasnip" } },
              },
            })
          end,
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  }
