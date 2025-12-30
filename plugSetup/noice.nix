{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      noice = {
        enable = true;
        routes = [
          {
            view = "notify";
            filter = {
              event = "msg_showmode";
            };
          }
        ];
      };
    };
  };
}
