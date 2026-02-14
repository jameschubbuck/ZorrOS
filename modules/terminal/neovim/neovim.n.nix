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

        require('telescope').setup({
          defaults = {
            layout_strategy = 'horizontal',
            layout_config = {
              width = 0.99,
              height = 0.99,
            },
          },
        })

        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            if vim.fn.argc() == 0 then
              require("telescope.builtin").find_files()
            end
          end,
        })
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
