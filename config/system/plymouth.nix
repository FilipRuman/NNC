{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.system.plymouth.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.nixConf.system.plymouth.enable {
    boot = {
      plymouth = {
        enable = true;
        theme = "rings_2";
        themePackages = with pkgs; [
          # By default we would install all themes
          (adi1090x-plymouth-themes.override {
            selected_themes = ["rings_2"];
          })
        ];
      };

      # Enable "Silent boot"
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "udev.log_level=3"
        "systemd.show_status=auto"

        # "video=efifb:off" # test
        # "nvidia.NVreg_EnableConsole=0"
      ];

      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      loader.timeout = 0;
    };
    boot.initrd.systemd.enable = true;
  };
}
