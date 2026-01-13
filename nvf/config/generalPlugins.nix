{
  vim = {
    git = {
      enable = true;
      gitsigns.enable = true;
    };
    terminal.toggleterm.lazygit = {
      enable = true;
      mappings.open = "<leader>gg";
    };
    clipboard = {
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
      enable = true;
    };
    telescope.enable = true;
    statusline = {
      lualine = {
        enable = true;
      };
    };
    autopairs.nvim-autopairs.enable = true;
  };
}
