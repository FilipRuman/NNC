{lib, ...}: {
  programs.ghostty.enable = true;
  programs.ghostty.settings = lib.mkForce {
    "background-opacity" = 0.9;
    "background-blur" = true;
    "clipboard-paste-protection" = true;
    "mouse-hide-while-typing" = true;
    "shell-integration" = "fish";
    "font-family" = "MesloLGM Nerd Font";
    "command" = "fish --login --interactive";
    "copy-on-select" = "clipboard";
  };
}
