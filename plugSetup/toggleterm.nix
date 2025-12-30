{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      dressing.enable = true;
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
          };
          open_mapping = "[[<c-\\>]]";
          insert_mappings = true;
        };
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>tf";
        action = "<Cmd>execute v:count . \"ToggleTerm direction=\\\"float\\\"\"<CR>";
        options = {
          desc = "Toggle Terminal";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>tt";
        action = "<Cmd>execute v:count . \"ToggleTerm direction=\\\"tab\\\"\"<CR>";
        options = {
          desc = "Toggle Terminal";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>th";
        action = "<Cmd>execute v:count . \"ToggleTerm direction=\\\"horizontal\\\"\"<CR>";
        options = {
          desc = "Toggle Terminal";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>tv";
        action = "<Cmd>execute v:count . \"ToggleTerm direction=\\\"vertical\\\"\"<CR>";
        options = {
          desc = "Toggle Terminal";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>ts";
        action = "<Cmd>TermSelect<CR>";
        options = {
          desc = "Toggle Terminal";
          silent = true;
        };
      }
    ];
  };
}
