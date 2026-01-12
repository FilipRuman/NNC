{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.nvim.enable = lib.mkEnableOption "enables neovim";
  };
  config = lib.mkIf config.nixConf.nvim.enable {
    environment.systemPackages = with pkgs; [
      neovide
      wl-clipboard
    ];
    programs.neovim = {
      enable = true;
    };
  };
}
