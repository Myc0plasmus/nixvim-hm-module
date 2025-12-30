{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    rPackages.languageserver
  ];
  nix.nixPath = [ "nixpkgs=${pkgs.path}" ];
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        # onAttach = ''
        # 	local function lspAttach(client)
        # 		print('LSP attached')
        # 		-- Example: Enable completion
        # 		require'completion'.on_attach(client)
        # 	end
        # '';
        servers = {
          ts_ls.enable = true;
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          dockerls.enable = true;
          clangd.enable = true;
          jsonls.enable = true;
          html.enable = true;
          cmake.enable = true;
          csharp_ls.enable = true;
          kotlin_language_server.enable = true;
          pyright.enable = true;
          # nil-ls.enable = true;
          nixd = {
            enable = true;
            settings = {
              formatting.command = [
                "nixfmt"
              ];
            };
          };

          # you have to define a package, it seems - I was lazy and I don't think I am going to be using R any time soon anyway
          r_language_server = {
            enable = true;
            package = null;
          };

        };
        # keymaps.diagnostic = {
        # 	"<space>e" = "open_float";
        # 	"<space>q" = "setloclist";
        # 	"[d" = "goto_prev";
        # 	"]d" = "goto_next";
        # 					};
        # keymaps.lspBuf = {
        # 	"K" = "hover";
        # 	"<space>ca" = "code_action";
        # 	"<leader>gD" = "declaration";
        # 	"<leader>rn" = "rename";
        # 	"<leader>gs" = "signature_help";
        # };
        # keymaps.extra = [
        # 	{mode = ["n"]; key = "<leader>gd"; action = "<cmd>Telescope lsp_definitions<cr>"; }
        # 	{mode = ["n"]; key = "<leader>gi"; action = "<cmd>Telescope lsp_implementations<cr>"; }
        # 	{mode = ["n"]; key = "<leader>go"; action = "<cmd>Telescope lsp_type_definitions<cr>"; }
        #
        # 	{mode = ["n"]; key = "<leader>gr"; action = "<cmd>Telescope lsp_references<cr>"; }
        # ];
      };
    };
    # keymaps = [
    # 	{mode = ["n"]; key = "<leader>gd"; action = "<cmd>Telescope lsp_definitions<cr>"; }
    # 	{mode = ["n"]; key = "<leader>gi"; action = "<cmd>Telescope lsp_implementations<cr>"; }
    # 	{mode = ["n"]; key = "<leader>go"; action = "<cmd>Telescope lsp_type_definitions<cr>"; }
    #
    # 	{mode = ["n"]; key = "<leader>gr"; action = "<cmd>Telescope lsp_references<cr>"; }
    # ];
    highlightOverride = {
      LspInfoBorder.fg = "#ffffff";
    };
  };
}
