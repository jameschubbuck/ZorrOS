{
  programs.nvf.settings.vim.luaConfigPost = ''
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = "none" })
  '';
}
