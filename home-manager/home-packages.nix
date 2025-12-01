{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    mpv
    telegram-desktop
    obsidian
    amnezia-vpn
    zathura
    discord

    # CLI utils
    cliphist
    ffmpeg
    nsxiv
    htop
    hyprpicker
    ripgrep
    tmux
    unzip
    wget
    yt-dlp
    neovim
    grimblast
    wl-clipboard


    # Coding stuff
    nodejs

    # WM
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    
    # Other
    brightnessctl
    iptables
    iproute2
    wireguard-tools
  ];
}
