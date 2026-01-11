{pkgs, ...}: {

  services.flatpak = {
    enable = true;
    packages = [
      "io.ente.auth"
      "app.zen_browser.zen"
      "com.brave.Browser"
      "com.discordapp.Discord"
      "org.gimp.GIMP"
      "org.kde.kdenlive"
      "com.unity.UnityHub"
    ];
  };
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
