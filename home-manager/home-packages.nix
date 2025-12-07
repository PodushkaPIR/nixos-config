{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    amnezia-vpn
    anki
    brave
    mpv
    telegram-desktop
    obsidian
    pavucontrol
    zathura
    discord
    wireshark

    # CLI utils
    autoconf
    tree
    cliphist
    cmake
    ffmpeg
    ffmpegthumbnailer
    fzf
    nsxiv
    htop
    hyprpicker
    ripgrep
    tmux
    unzip
    wget
    yt-dlp
    neovim
    playerctl
    pkg-config
    neofetch
    grimblast
    wl-clipboard
    yazi

    # Coding stuff
    nodejs
    python312Packages.pip
    python312Packages.ninja
    boost
    go

    # WM
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    
    # Other
    rocmPackages.llvm.clang-unwrapped
    amneziawg-tools
    wireguard-tools
    brightnessctl
    iptables
    iproute2
  ];
}
