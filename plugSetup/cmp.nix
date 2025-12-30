{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          # window = {
          # 	completion.border= [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
          # 	documentation.border= [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
          # };

          mapping = {
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-a>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<TAB>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "treesitter"; }
            { name = "luasnip"; }
            { name = "cmp-tabnine"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
        cmdline = {
          "/" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              { name = "buffer"; }
            ];
          };
          ":" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              { name = "path"; }
              { name = "cmdline"; }
            ];
          };
        };
      };
    };
  };
}
