{
  pkgs,
  ...
}:

let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = project-nvim;
        config = toLuaFile ./project-nvim_config.lua;
      }
    ];
  
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>tp";
        action = "<cmd>Telescope projects<cr>";
      }
    ];
  };
}
