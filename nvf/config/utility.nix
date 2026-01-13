{
  vim = {
    utility = {
      yazi-nvim = {
        enable = true;
        mappings.openYazi = "m";
        setupOpts.open_for_directories = true;
      };
      motion.flash-nvim = {
        enable = true;
        mappings = {
          jump = "s";
          remote = "r";
        };
      };

      # ccc.enable = false;
      vim-wakatime.enable = true;
      diffview-nvim.enable = true;
      qmk-nvim.enable = false; # requires hardware specific options
      icon-picker.enable = true;
      surround.enable = true;
      # leetcode-nvim.enable = true;
      multicursors.enable = true;
      smart-splits.enable = true;
      undotree.enable = true;

      motion = {
        precognition.enable = true;
      };
      images = {
        img-clip.enable = true;
      };
    };
  };
}
