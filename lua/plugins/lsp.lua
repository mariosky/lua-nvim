-- Ensure the return table is correctly closed
return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- 2026 Native API (Neovim 0.11+)
    vim.lsp.config('lua_ls', {
      settings = { Lua = { diagnostics = { globals = {'vim'} } } }
    })
    vim.lsp.enable('lua_ls')
    -- Ensure every '{' has a matching '}' 
  end,
}

