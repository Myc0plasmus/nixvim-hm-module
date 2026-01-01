{...}:

{
  programs.nixvim = {
    plugins = {
      project-nvim = {
        enable = true;
        enableTelescope = true;
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>tp";
        action = "<cmd>Telescope projects<cr>";
      }
    ];
  };
}
