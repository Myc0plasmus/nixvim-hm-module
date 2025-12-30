{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      trouble = {
        enable = true;
        # settings = {
        #   use_diagnostic_signs = true;
        # };
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>xx";
        action = "<Cmd>Trouble diagnostics toggle<CR>";
        options = {
          desc = "Diagnostics (Trouble)";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>xX";
        action = "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>";
        options = {
          desc = "Buffer Diagnostics (Trouble)";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>cs";
        action = "<Cmd>Trouble symbols toggle focus=false<CR>";
        options = {
          desc = "Symbols (Trouble)";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>cl";
        action = "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>";
        options = {
          desc = "LSP Definitions / references / ... (Trouble)";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>xL";
        action = "<Cmd>Trouble loclist toggle<cr><CR>";
        options = {
          desc = "Location List (Trouble))";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>xQ";
        action = "<Cmd>Trouble qflist toggle<cr><CR>";
        options = {
          desc = "Quickfix List (Trouble)";
          silent = true;
        };
      }
    ];
  };
}
