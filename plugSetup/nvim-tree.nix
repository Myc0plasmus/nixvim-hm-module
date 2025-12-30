{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      nvim-tree.enable = true;
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>no";
        action = "<cmd>NvimTreeOpen<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>nc";
        action = "<cmd>NvimTreeClose<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>nn";
        action = "<cmd>NvimTreeFocus<cr>";
      }
    ];
  };
}
