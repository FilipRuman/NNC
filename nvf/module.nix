{
 programs.nvf = {
    enable = true;
    
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
    vim ={
      viAlias = false;
      vimAlias = true;
      lsp = {
        enable = true;
      };
 theme = {
enable = true;
};
};
languages.nix.enable = true;
	statusline.lualine.enable = true;
	telescope.enable = true;
	autocomplete.nvim-cmp.enable = true;

    };
  };

}
