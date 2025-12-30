{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            mode = [ "n" ];
            action = "find_files";
          };
          "<leader>fg" = {
            mode = [ "n" ];
            action = "live_grep";
          };
          "<leader>fb" = {
            mode = [ "n" ];
            action = "buffers";
          };
          "<leader>gs" = {
            mode = [ "n" ];
            action = "git_status";
          };
          "<leader>gb" = {
            mode = [ "n" ];
            action = "git_branches";
          };
          "<leader>gc" = {
            mode = [ "n" ];
            action = "git_commits";
          };
        };
        settings = {
          defaults = {
            layout_strategy = "flex";
            border = true;
            borderchars = [
              "─"
              "│"
              "─"
              "│"
              "┌"
              "┐"
              "┘"
              "└"
            ];
          };
        };
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>t";
        action = "<cmd>Telescope<cr>";
      }
    ];
    highlightOverride = {
      TelescopeBorder.fg = "#ffffff";
      TelescopeResultsTitle.fg = "#ffffff";
      TelescopePromptTitle.fg = "#ffffff";
    };
  };
}
