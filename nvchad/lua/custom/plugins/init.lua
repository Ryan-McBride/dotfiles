return {
  ["lukas-reineke/lsp-format.nvim"] = {},
  ["dense-analysis/ale"] = {
    config = function()
      require "custom.plugins.ale"
    end,
  },
}
