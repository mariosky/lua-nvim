vim.filetype.add({
  extension = {
    pl = function(_, bufnr)
      local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
      if first_line:match("^#!.*%f[%w]perl[%d.]*%f[%W]") then
        return "perl"
      end
      return "prolog"
    end,
    prolog = "prolog",
  },
})

vim.api.nvim_create_user_command("Scryer", function()
  local source = vim.api.nvim_buf_get_name(0)
  if vim.bo.filetype ~= "prolog" or vim.bo.buftype ~= "" or vim.fn.filereadable(source) ~= 1 then
    vim.notify("Abre y guarda un archivo Prolog antes de ejecutar :Scryer.", vim.log.levels.WARN)
    return
  end

  if vim.bo.modified then
    vim.notify("Guarda los cambios antes de ejecutar :Scryer.", vim.log.levels.WARN)
    return
  end

  if vim.fn.executable("scryer-prolog") ~= 1 then
    vim.notify("No se encontró scryer-prolog en PATH.", vim.log.levels.ERROR)
    return
  end

  vim.cmd("botright new")
  local job = vim.fn.jobstart({ "scryer-prolog", source }, { term = true })
  if job <= 0 then
    vim.cmd("close")
    vim.notify("No se pudo iniciar Scryer Prolog.", vim.log.levels.ERROR)
    return
  end
  vim.cmd("startinsert")
end, { desc = "Cargar el archivo Prolog actual en Scryer" })
