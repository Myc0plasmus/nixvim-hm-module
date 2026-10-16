{pkgs, ...}:

{
  programs.nixvim = {
    plugins = {
      dap = {
        enable = true;
        adapters.servers.codelldb = {
          host = "127.0.0.1";
          port = 13000;

          executable = {
            command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
            args = [ "--port" "13000" ];
          };
        };
      };
      # dap-python.enable = true;
      # dap-lldb.enable = true;
      dap-virtual-text.enable = true;
    };
  };
}
