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
        key = "<C-s>";
        mode = ["n" "v"];
        silent = true;
        action = "<cmd>wa!<CR>";
      }
      {
        key = "U";
        mode = ["n" "v"];
        silent = true;
        action = "<cmd>redo<CR>";
      }
      # delete to void

      {
        key = "<leader>d";
        mode = ["n" "v"];
        silent = true;
        action = "\"_d";
      }
      {
        key = "<leader>c";
        mode = ["n" "v"];
        silent = true;
        action = "\"_c";
      }

      {
        key = "<leader>u";
        mode = ["n"];
        silent = true;
        action = "<cmd>UndotreeToggle<CR>";
      }

      {
        key = "<leader>k";
        mode = ["n"];
        silent = true;
        action = "<cmd>lnext<CR>zz";
      }
      {
        key = "<leader>j";
        mode = ["n"];
        silent = true;
        action = "<cmd>lprev<CR>zz";
      }

      {
        key = "K";
        mode = ["n" "v"];
        silent = true;
        action = "<C-u>";
      }

      {
        key = "J";
        mode = ["n" "v"];
        silent = true;
        action = "<C-d>";
      }
    ];
  };
}
