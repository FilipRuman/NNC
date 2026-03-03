{
  flake-file.inputs.steam-config-nix = {
    url = "github:different-name/steam-config-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.steam = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [inputs.steam-config-nix.nixosModules.default];

    programs = {
      gamemode.enable = true;
      steam = {
        extraCompatPackages = with pkgs; [
          # proton-cachyos-x86_64-v4
          # proton-dw
          # proton-em
          proton-ge-bin
        ];
        protontricks.enable = true;
        package = pkgs.steam.override {
          extraProfile = ''
            export PROTON_ENABLE_WAYLAND=1
            export PROTON_ENABLE_HDR=1
          '';
        };

        gamescopeSession.enable = true;
        enable = true;
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
        config = {
          enable = true;
          closeSteam = true;
          defaultCompatTool = "GE-Proton";

          apps = {
            cyberpunk-2077 = {
              id = 1091500;
              compatTool = "GE-Proton";
              launchOptions = {
                env.WINEDLLOVERRIDES = "winmm,version=n,b";
                args = [
                  "--launcher-skip"
                  "-skipStartScreen"
                ];
              };
            };
          };
        };
      };
    };
  };
}
