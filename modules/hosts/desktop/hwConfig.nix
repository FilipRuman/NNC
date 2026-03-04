{
  flake.nixosModules.desktop = {
    config,
    lib,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-amd"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/bac8161a-fcc7-465d-9944-549efd76e1a0";
      fsType = "ext4";
    };

    boot.initrd.luks.devices."luks-9c6c352a-9681-4e52-885f-3a33e9ce92fe".device = "/dev/disk/by-uuid/9c6c352a-9681-4e52-885f-3a33e9ce92fe";

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/2BB5-71EB";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    environment.etc."crypttab".text = ''
      data_crypt UUID=e30f59fc-0341-4b86-8cfe-8084ff2a8c1d /root/keys/data.key luks
    '';

    fileSystems."/data" = {
      device = "/dev/mapper/data_crypt";
      fsType = "ext4";
    };

    # swapDevices =
    #   [ { device = "/dev/disk/by-uuid/f923d65d-a077-43e4-9d5e-b9bb33be36f7"; }
    #   ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp14s0.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp13s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
