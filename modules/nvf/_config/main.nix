{pkgs, ...}: {
  vim = {
    luaConfigPre = ''
      vim.g.neovide_opacity = 0.9
      vim.g.neovide_floating_shadow = false
      vim.g.neovide_fullscreen = true
      vim.g.neovide_cursor_vfx_mode = 'pixiedust'
      vim.g.neovide_refresh_rate = 144
      vim.o.guifont = 'FiraCode Nerd Font:h14'
      if vim.g.neovide == true then
        vim.api.nvim_set_keymap('n', '<C-=>', ':lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<CR>', { silent = true })
        vim.api.nvim_set_keymap('n', '<C-->', ':lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>', { silent = true })
        vim.api.nvim_set_keymap('n', '<C-+>', ':lua vim.g.neovide_opacity = math.min(vim.g.neovide_opacity + 0.05, 1.0)<CR>', { silent = true })
        vim.api.nvim_set_keymap('n', '<C-_>', ':lua vim.g.neovide_opacity = math.max(vim.g.neovide_opacity - 0.05, 0.0)<CR>', { silent = true })
      end
                        vim.diagnostic.config({virtual_text = true})
                  vim.lsp.enable('codebook')
            vim.lsp.config('codebook', {
              filetypes = { 'nix','cs','rust' },
            })
    '';
    extraPackages = [pkgs.codebook];
  };
  imports = [
    ./generalPlugins.nix
    ./keyBindings.nix
    ./keyBindings.nix
    ./lang.nix
    ./lsp.nix
    ./notes.nix
    ./utility.nix
    ./visuals.nix
  ];
}
