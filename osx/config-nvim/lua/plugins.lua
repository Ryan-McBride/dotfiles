vim.cmd [[packeradd packer.nvim,]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
end)
