{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # main software
    neovim
    emacs
    git
    alacritty

    # other software
    vim
    luajit
    neofetch
    starship
    minetest
    home-manager
    yazi
    glow
    qemu
    
    # programming tools
    roswell
    pkg-config
    gnumake
    cmake
    perl
    rustup
    zig
    zls
    ghc
    cabal-install
    carp
    nodejs

    # Java
    zulu
    gradle
  ];

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

  # variables
  environment.variables = {
    EDITOR = "emacs";
  };
}
