{
  flake.homeModules.general = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "flatpak run app.zen_browser.zen";
      TERMINAL = "ghostty";
    };
    programs.home-manager.enable = true;
  };
}
