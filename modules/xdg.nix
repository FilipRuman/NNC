{
  flake.homeModules.general =
    { config, pkgs, ... }:

    let
      yaziGhostty = pkgs.writeShellScriptBin "yazi-ghostty" ''
        set -eu

        DIR="''${1:-.}"

        exec ${pkgs.ghostty}/bin/ghostty -e ${pkgs.fish}/bin/fish -ic "cd \"$DIR\"; and yazi; and exec fish"
      '';
    in
    {
      home.packages = [
        yaziGhostty
      ];

      xdg.mimeApps.enable = true;
      xdg.dataFile."kio/servicemenus/yazi-directory.desktop".text = ''
        [Desktop Entry]
        Type=Service
        MimeType=inode/directory;
        Actions=open;

        [Desktop Action open]
        Name=Open in Yazi
        Exec=yazi-ghostty %f
      '';
      xdg.configFile."kdeglobals".text = ''
        [General]
        FileManager=yazi-ghostty.desktop
      '';
      xdg.mimeApps.defaultApplications = {
        "inode/directory" = [ "yazi-ghostty.desktop" ];

        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "text/html" = [ "zen.desktop" ];
        "application/xhtml+xml" = [ "zen.desktop" ];

        "text/plain" = [ "neovide.desktop" ];
      };

      xdg.desktopEntries.yazi-ghostty = {
        name = "Yazi (Ghostty)";
        exec = "${yaziGhostty}/bin/yazi-ghostty %f";
        terminal = false;
        type = "Application";
        categories = [ "Utility" ];
        mimeType = [ "inode/directory" ];
      };

      xdg.terminal-exec.enable = true;

      xdg.terminal-exec.settings = {
        default = [ "com.mitchellh.ghostty.desktop" ];
        Hyprland = [ "com.mitchellh.ghostty.desktop" ];
      };

      home.sessionVariables = {
        TERMINAL = "ghostty";
        BROWSER = "zen";
        EDITOR = "nvim";
        VISUAL = "neovide";
      };
    };
}
