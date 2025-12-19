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
    libsForQt5.okular
    # wireshark

    # CLI utils
    lazydocker
    tshark
    autoconf
    cava
    tree
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    nsxiv
    htop
    hyprpicker
    ripgrep
    tree-sitter
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
    gnumake
    cmake
    gdb

    # WM
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    
    # Other
    cm_unicode
    # texliveTeTeX
    texliveMedium
    rocmPackages.llvm.clang-unwrapped
    amneziawg-tools
    wireguard-tools
    brightnessctl
    iptables
    iproute2
  ];
}
