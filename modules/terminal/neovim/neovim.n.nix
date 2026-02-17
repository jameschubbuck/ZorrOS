{
  config,
  lib,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
  transparentGroups = [
    "Normal"
    "NormalNC"
    "NormalFloat"
    "FloatBorder"
    "SignColumn"
    "LineNr"
    "CursorLineNr"
    "EndOfBuffer"
    "GitSignsAdd"
    "GitSignsChange"
    "GitSignsDelete"
    "DiagnosticSignError"
    "DiagnosticSignWarn"
    "DiagnosticSignInfo"
    "DiagnosticSignHint"
    "TelescopeNormal"
    "TelescopePromptNormal"
    "TelescopeResultsNormal"
    "TelescopePreviewNormal"
    "TelescopePromptPrefix"
    "FoldColumn"
    "Folded"
    "GitSignsCurrentLineBlame"
    "GitSignsAddLn"
    "GitSignsChangeLn"
    "GitSignsDeleteLn"
  ];
  borderGroups = [
    "TelescopeBorder"
    "TelescopePromptBorder"
    "TelescopeResultsBorder"
    "TelescopePreviewBorder"
  ];
  mkTransparentHighlight = group: ''vim.cmd("highlight ${group} guibg=NONE ctermbg=NONE")'';
  mkBorderHighlight = group: ''vim.cmd("highlight ${group} guibg=NONE ctermbg=NONE guifg=${colors.base0D}")'';
  highlightLua = lib.concatStringsSep "\n" (
    (map mkTransparentHighlight transparentGroups)
    ++ (map mkBorderHighlight borderGroups)
    ++ [''vim.cmd("highlight TelescopeSelection guibg=NONE ctermbg=NONE guifg=${colors.base0E}")'']
  );
in {
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme.transparent = true;
      ui.borders.enable = true;
      luaConfigPost =
        builtins.readFile ./lua/telescope.lua + "\n" + highlightLua;
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
