{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>fh";
        action = "<cmd>Telescope harpoon marks<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>ha";
        action.__raw = "function() require'harpoon':list():add() end";
      }
      {
        mode = [ "n" ];
        key = "<leader>hh";
        action.__raw = "function() harpoon.ui:toggle_quick_menu(harpoon:list()) end";
      }
      {
        mode = [ "n" ];
        key = "<leader>hu";
        action.__raw = "function() harpoon:list():next() end";
      }
      {
        mode = [ "n" ];
        key = "<leader>hb";
        action.__raw = "function() harpoon:list():prev() end";
      }
    ];
  };
}
