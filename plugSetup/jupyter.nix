{
  ...
}:

{
  programs.nixvim = {
    plugins = {
      molten = {
        enable = true;
        settings = {
          image_provider = "image.nvim";
        };
      };
      image = {
        enable = true;
        settings = {
          backend = "kitty";
        };
      };
      jupytext.enable = true;
      hydra.enable = true;
      notebook-navigator = {
        enable = true;
        settings = {
          repl_provide = "molten";
          activate_hydra_keys = "<leader>rc";
        };
      };
    };
  };
}
