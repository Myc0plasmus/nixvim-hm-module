{
  config,
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
        plugin = overseer-nvim;
        config = toLuaFile ./overseer_config.lua;
      }
    ];
  };
  # keymaps = [
  # 	{mode = ["n"]; key = "<leader>rt"; action = "<cmd>Telescope asynctasks all<cr>"; }
  # ];
}
