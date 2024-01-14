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
    # main software
    neovim
    emacs
    kakoune
    git
    alacritty
    direnv
    zsh
    clojure
    leiningen

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
    libtool
    libiconv
    tree-sitter
    vscodium
    

    # programming tools
    roswell
    gnumake
    cmake
    perl
    rustup
    zig
    zls
    ghc
    cabal-install
    nodejs
    clang
    go
    gopls
  ];
}
