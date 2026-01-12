{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixconf.nvim.enable = lib.mkenableoption "enables neovim";
  };
  config = lib.mkif config.nixconf.nvim.enable {
    environment.systempackages = with pkgs; [
      neovide
      wl-clipboard
    ];
    programs.neovim = {
      enable = true;
      defaulteditor = true;
      vialias = true;
      vimalias = true;
    };
  };
}
