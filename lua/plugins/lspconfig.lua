return { -- Ensure this 'return' is present
  "neovim/nvim-lspconfig",
  dependencies = { 
    "williamboman/mason.nvim", 
    "williamboman/mason-lspconfig.nvim" 
  },
  config = function()
    -- 1. Setup Mason first
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" }, -- add other servers here
    })

    -- 2. Use 2026 Native API (Neovim 0.11+) instead of require('lspconfig')
    -- Configure your servers
    vim.lsp.config('lua_ls', {
      settings = { Lua = { diagnostics = { globals = {'vim'} } } }
    })

    -- 3. Enable the servers
    vim.lsp.enable('lua_ls')
  end,
}

