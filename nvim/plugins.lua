local plugins = {

  {
    "github/copilot.vim" , lazy = false
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "jedi-language-server",
        "rust-analyzer",
      },
    },
  }

}

return plugins