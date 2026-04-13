return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup()

    ts.install({
      "lua",
      "vim",
      "vimdoc",
      "python",
      "javascript",
      "html",
      "css",
      "bash",
      "json",
      "markdown",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "python",
        "javascript",
        "html",
        "css",
        "sh",
        "json",
        "markdown",
        "vim",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
}
