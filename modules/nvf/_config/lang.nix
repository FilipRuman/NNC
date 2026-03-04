{
  vim = {
    # spellcheck = {
    #   enable = true;
    #   programmingWordlist.enable = true;
    # };
    diagnostics = {
      config = {
        virtual_text = true;
      };
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = false;
      json.enable = true;
      sql.enable = true;
      go.enable = true;
      lua.enable = true;
      zig.enable = false;
      python.enable = true;
      typst.enable = false;

      rust = {
        enable = true;
        extensions.crates-nvim.enable = true;
      };
      assembly.enable = true;
      astro.enable = true;
      csharp = {
        enable = true;
        lsp.servers = ["roslyn_ls"];
      };
      nim.enable = true;

      # Language modules that are not as common.
      ts.enable = false;
      ocaml.enable = false;
    };
  };
}
