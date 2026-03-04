{
  vim = {
    lsp = {
      # This must be enabled for the language modules to hook into
      # the LSP API.
      enable = true;
      formatOnSave = true;
      lspkind.enable = false;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = false; # conflicts with blink in maximal
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      lspconfig.enable = true;
      mappings = {
        codeAction = "<Leader>c";
        hover = "<Leader>k";
        listReferences = "<C-q>";
        goToDefinition = "<C-d>";

        renameSymbol = "<F2>";
      };
      harper-ls = {
        enable = true;
        settings = {
          linters = {
            BoringWords = true;
            PossessiveNoun = true;
            SentenceCapitalization = true;
            SpellCheck = true;
            userDictPath = "~/.config/harper/custom.dict";
          };
        };
      };
    };

    snippets.luasnip.enable = true;
    autocomplete = {
      blink-cmp = {
        enable = true;
        mappings = {
          confirm = "<Tab>";
          next = "<down>";
          previous = "<up>";
        };
      };
    };
  };
}
