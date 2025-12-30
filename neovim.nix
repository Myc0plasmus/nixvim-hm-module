{
  config,
  pkgs,
  ...
}:

let
  getConfig = str: ./plugSetup/${str};
in
{
  imports = [
    (getConfig "nvim-tree.nix")
    (getConfig "telescope.nix")
    (getConfig "toggleterm.nix")
    (getConfig "cmp.nix")
    (getConfig "luasnip.nix")
    (getConfig "hop.nix")
    (getConfig "lspsaga.nix")
    # (getConfig "project.nix")
    # (getConfig "nvim-window-picker.nix")
    (getConfig "harpoon.nix")
    (getConfig "lsp.nix")
    (getConfig "which-key.nix")
    (getConfig "asynctasks.nix")
    (getConfig "suda.nix")
    (getConfig "trouble.nix")
    (getConfig "spectre.nix")
    # (getConfig "overseer.nix")
    # (getConfig "noice.nix")

  ];
  #  home.packages = with pkgs; [
  # zip
  # unzip
  # ripgrep
  # go 
  # cargo
  # lua
  # luajit
  # luajitPackages.luacheck
  # stylua
  # gcc
  # gnumake
  #  ];
  home.packages = with pkgs; [
    lazygit
    ripgrep
  ];
  programs.nixvim = {
    enable = true;
    enableMan = true;
    extraConfigLuaPre = builtins.readFile ./luaConfigs/options.lua;
    extraConfigLua = builtins.readFile ./luaConfigs/mappings.lua;
    extraConfigLuaPost = builtins.readFile ./luaConfigs/additionalPluginConfig.lua;
    clipboard.providers.xclip.enable = true;
	  extraFiles = {
      "ftplugin/nix.lua".text = ''
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.expandtab = true
        '';
    };

    # colorschemes.cyberdream.enable = true;
    colorschemes.base16 = {
      enable = true;
      # colorscheme = "primer-dark";
      # my colorscheme
      colorscheme = {
        base00 = "#000000";
        base01 = "#21262d";
        base02 = "#30363d";
        base03 = "#484f58";
        base04 = "#8b949e";
        base05 = "#b1bac4";
        base06 = "#c9d1d9";
        base07 = "#f0f6fc";
        base08 = "#b00404";
        base09 = "#f0883e";
        base0A = "#d29922";
        base0B = "#3fb950";
        base0C = "#a5d6ff";
        base0D = "#58a6ff";
        base0E = "#ff7b72";
        base0F = "#bd561d";
      };
      # base primer-dark
      # colorscheme = {
      # 	base00 = "#010409";
      # 	base01 = "#21262d";
      # 	base02 = "#30363d";
      # 	base03 = "#484f58";
      # 	base04 = "#8b949e";
      # 	base05 = "#b1bac4";
      # 	base06 = "#c9d1d9";
      # 	base07 = "#f0f6fc";
      # 	base08 = "#ff7b72";
      # 	base09 = "#f0883e";
      # 	base0A = "#d29922";
      # 	base0B = "#3fb950";
      # 	base0C = "#a5d6ff";
      # 	base0D = "#58a6ff";
      # 	base0E = "#f778ba";
      # 	base0F = "#bd561d";
      # };
    };
    plugins = {
      lualine.enable = true;
      comment.enable = true;
      treesitter.enable = true;
      marks.enable = true;
      gitsigns.enable = true;
      colorizer.enable = true;
      hardtime = {
        enable = true;
        settings.disable_mouse = false;
      };
      notify.enable = true;
      web-devicons.enable = true;
      oil = {
        enable = true;
        luaConfig.post = builtins.readFile ./plugSetup/oil.lua;
      };
    };
  };
}
