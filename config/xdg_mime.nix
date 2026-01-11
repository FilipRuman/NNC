{pkgs, ...}: {
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    "text/html" = "app.zen_browser.zen";
    "x-scheme-handler/http" = "app.zen_browser.zen";
    "x-scheme-handler/https" = "app.zen_browser.zen";
    "x-scheme-handler/about" = "app.zen_browser.zen";
    "x-scheme-handler/unknown" = "app.zen_browser.zen";
  };
}
