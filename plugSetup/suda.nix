{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      vim-suda
    ];

  };
}
