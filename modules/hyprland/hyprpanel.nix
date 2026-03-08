{
  flake.homeModules.general = {
    programs.hyprpanel = {
      enable = true;
      settings = {
        left = [
          "dashboard"
          "workspaces"
          "media"
        ];

        middle = [];
      };
    };
  };
}
