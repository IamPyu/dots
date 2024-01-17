{config, pkgs, ...}:

{
  # fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["Iosevka" "Inconsolata"];})
    iosevka
  ];

  # services
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
  services.yabai = {
    enable = false;
    package = pkgs.yabai;
    enableScriptingAddition = true;
  };
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
  };
  services.karabiner-elements.enable = true;

  # variables
  environment.variables = {
    EDITOR = "emacs";
  };

  # software
  environment.systemPackages = with pkgs; [
    neovim
    emacs
    git
    alacritty
    direnv
    zsh

    vim
    neofetch
    minetest
    home-manager
    yazi
    glow
  ];
}
