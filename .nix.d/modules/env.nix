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
    enable = true;
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
    direnv
    pfetch
    home-manager
    yazi
    glow
  ];
}
