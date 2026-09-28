{...}:

{
  programs.nixvim = {
    plugins = {
      dap.enable = true;
      dap-python.enable = true;
      dap-lldb.enable = true;
      dap-virtual-text.enable = true;
    };
  };
}
