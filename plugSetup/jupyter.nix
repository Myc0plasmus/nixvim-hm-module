{
  ...
}:

{
  programs.nixvim = {
    plugins = {
      molten.enable = true;
      jupytext.enable = true;
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
