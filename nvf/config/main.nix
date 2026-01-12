{pkgs,lib,...}:{
vim ={
theme = {
enable = true;
name = "gruvbox";
};
languages ={
nix.enable = true;
rust.enable = true;
enableLSP = true;
enableTreesitter = true;
};
statusline.lualine.enable = true;
telescope.enable = true;
autocomplete.nvim-cmp.enable = true;

utility.yazi-nvim.enable = true;
utility.yazi-nvim.mappings.openYazi = "m";
};


}
