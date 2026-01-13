{
  xdg.configFile."codebook/codebook.toml" = {
    text = builtins.readFile ./codebook.toml;
  };
}
