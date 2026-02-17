require('telescope').setup({
  defaults = {
    border = true,
    layout_strategy = 'horizontal',
    prompt_prefix = "   ",
    selection_caret = "  ",
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function()
        require("telescope.builtin").find_files()
      end)
    end
  end,
})
