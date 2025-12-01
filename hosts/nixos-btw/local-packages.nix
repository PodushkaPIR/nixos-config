{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    git
    hyprland
    hyprlock
    wofi
    waybar
    kitty
    firefox
  ];
}
