{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      lspsaga = {
        enable = true;
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<space>ca";
        action = "<cmd>Lspsaga code_action<cr>";
      }
      {
        mode = [ "n" ];
        key = "]d";
        action = "<cmd>Lspsaga diagnostic_jump_next<cr>";
      }
      {
        mode = [ "n" ];
        key = "[d";
        action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      }
      {
        mode = [ "n" ];
        key = "<space>e";
        action = "<cmd>Lspsaga show_cursor_diagnostics<cr>";
      }
      {
        mode = [ "n" ];
        key = "<space>el";
        action = "<cmd>Lspsaga show_line_diagnostics<cr>";
      }
      {
        mode = [ "n" ];
        key = "<space>q";
        action = "<cmd>Lspsaga show_buffer_diagnostics ++normal<cr>";
      }
      {
        mode = [ "n" ];
        key = "<space>p";
        action = "<cmd>Lspsaga show_project_diagnostics ++normal<cr>";
      }
      {
        mode = [ "n" ];
        key = "K";
        action = "<cmd>Lspsaga hover_doc<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>hd";
        action = "<cmd>Lspsaga peek_definition<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>ht";
        action = "<cmd>Lspsaga peek_type_definition<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>gd";
        action = "<cmd>Lspsaga goto_definition<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>gt";
        action = "<cmd>Lspsaga goto_type_definition<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>lf";
        action = "<cmd>Lspsaga finder<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>li";
        action = "<cmd>Lspsaga finder imp<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>lo";
        action = "<cmd>Lspsaga outline<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>rp";
        action = "<cmd>Lspsaga rename ++project<cr>";
      }
      {
        mode = [ "n" ];
        key = "<leader>rn";
        action = "<cmd>Lspsaga rename<cr>";
      }
    ];
  };
}
