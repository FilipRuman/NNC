{
  vim = {
    luaConfigPost = ''
      vim.api.nvim_set_hl(0, "Comment", {
         fg = "#d8b845",
         italic = true,
       })
       -- Ensure Treesitter respects it
       vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

      vim.diagnostic.config({
          float = {
            border = "rounded"
          }
        })
    '';

    theme = {
      enable = true;
      transparent = false;
    };

    dashboard = {
      alpha.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };
    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim = {
        # doesn't work D:
        enable = false;
        setupOpts.colors = {visual = "#fffffff";};
      };
      illuminate.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true;
    };

    comments = {
      comment-nvim.enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };
  };
}
