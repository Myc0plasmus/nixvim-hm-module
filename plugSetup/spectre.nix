{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      spectre = {
        enable = true;
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>S";
        action = "<Cmd>lua require(\"spectre\").toggle()<CR>";
        options = {
          desc = "Toggle Spectre";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>sw";
        action = "<Cmd>lua require(\"spectre\").open_visual({select_word=true})<CR>";
        options = {
          desc = "Search current word";
          silent = true;
        };
      }
      {
        mode = [ "v" ];
        key = "<leader>sw";
        action = "<Cmd>lua require(\"spectre\").open_visual()<CR>";
        options = {
          desc = "Search current word";
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>sp";
        action = "<Cmd><cmd>lua requirea(\"spectre\").open_file_search({select_word=true})<CR>";
        options = {
          desc = "Search on current file";
          silent = true;
        };
      }
      
    ];
  };
}
