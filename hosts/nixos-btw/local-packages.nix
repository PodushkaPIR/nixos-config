{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    git
    hyprland
    hyprlock
    wireshark
    wofi
    waybar
    kitty
    firefox
    libpcap
    bash
    gcc
    docker

    fcitx5
    qemu
    virt-manager
    virt-viewer
    libvirt
    spice
    quickemu
    libreoffice-qt
    jdk
  ];
}
