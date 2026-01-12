{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.terminalEnhancements.enable = lib.mkEnableOption "enables basic terminal enhancements packages that are core to my workflow";
  };
  config = lib.mkIf config.terminalEnhancements.enable {
    environment.systemPackages = with pkgs; [
      fzf
      fd
      starship
      zoxide
      f3d
      yazi
      ripgrep
      fd
      fish
      delta # git diff
      qalculate-qt
      lazygit
      lf

      unrar
      unzip
    ];
  };
}
