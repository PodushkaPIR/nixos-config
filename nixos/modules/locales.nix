{ config, pkgs, ... }: {
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "C.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "zh_TW.UTF-8/UTF-8"
    ];
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      # ignoreUserConfig = true;
      waylandFrontend = true;
      
      addons = with pkgs; [
        fcitx5-mozc            
        fcitx5-gtk             
        fcitx5-configtool      
        libsForQt5.fcitx5-qt  
        fcitx5-rime          
      ];
      
      settings = {
        inputMethod = {
          "Groups/0" = {
             Name = "MultiLang";
             "Default Layout" = "us";
             DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "rime";      
          "Groups/0/Items/2".Name = "mozc";     
          "Groups/0/Items/3".Name = "rime";    
        };
      };
    };
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  
  environment.variables = {
    XMODIFIERS = "@im=fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
}
