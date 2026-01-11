{
  boot = {
    # Bootloader
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      timeout = 1;
    };
  };
}
