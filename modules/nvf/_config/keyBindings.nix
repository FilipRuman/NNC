{
  vim = {
    binds.whichKey.enable = true;
    binds.cheatsheet.enable = true;
    options.laststatus = 0;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        key = "<C-s>";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.format({ async = false })<CR><cmd>wa!<CR>";
        desc = "Format and save";
      }
      {
        key = "<leader>tdd";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })<CR>";
        desc = "Disable diagnostics";
      }
      {
        key = "<leader>q";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.setqflist()<Cr>";
      }
      {
        key = "<down>";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.goto_next()<Cr>";
      }
      {
        key = "<up>";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.goto_prev()<Cr>";
      }

      {
        key = "<leader><leader>";
        mode = "n";
        silent = true;
        action = "<leader>ff";
      }
      {
        key = "jj";
        mode = "i";
        silent = true;
        action = "<Esc>";
      }
      {
        key = "U";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "<cmd>redo<CR>";
      }
      # delete to void

      {
        key = "<leader>d";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "\"_d";
      }
      {
        key = "<leader>c";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "\"_c";
      }

      {
        key = "<leader>u";
        mode = [ "n" ];
        silent = true;
        action = "<cmd>UndotreeToggle<CR>";
      }

      {
        key = "<leader>k";
        mode = [ "n" ];
        silent = true;
        action = "<cmd>lnext<CR>zz";
      }
      {
        key = "<leader>j";
        mode = [ "n" ];
        silent = true;
        action = "<cmd>lprev<CR>zz";
      }

      {
        key = "K";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "<C-u>";
      }

      {
        key = "J";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "<C-d>";
      }
    ];
  };
}
