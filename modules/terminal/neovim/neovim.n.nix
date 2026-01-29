{
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme.transparent = true;
      luaConfigPost = ''
        local groups = {
          "Normal", "NormalNC", "NormalFloat", "FloatBorder",
          "SignColumn", "LineNr", "CursorLineNr", "EndOfBuffer",
          "GitSignsAdd", "GitSignsChange", "GitSignsDelete",
          "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint"
        }

        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
      '';
      spellcheck = {
        enable = true;
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        lspSignature.enable = true;
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        markdown.enable = true;
        ts.enable = true;
        clang.enable = true;
        html.enable = true;
        tailwind.enable = true;
        rust.enable = true;
      };
      statusline = {
        lualine = {
          enable = true;
        };
      };
      autopairs.nvim-autopairs.enable = true;
      autocomplete = {
        nvim-cmp.enable = true;
      };
      snippets.luasnip.enable = true;
      treesitter.context.enable = true;
      telescope.enable = true;
      utility = {
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
      };
      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
