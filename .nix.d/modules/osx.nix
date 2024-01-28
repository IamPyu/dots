{
  system.defaults.NSGlobalDomain = {
    ApplePressAndHoldEnabled = true;
  };

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.2;
    orientation = "left";
    magnification = true;
    tilesize = 33;
    mineffect = "suck";
    minimize-to-application = true;
  };

  system.defaults.finder = {
    ShowPathbar = true; # show the path below
    FXEnableExtensionChangeWarning = false; # show warning when changing file extensions
    #NSTableViewDefaultSizeMode = 1; # finder sidebar size
    CreateDesktop = false; # show icons on desktop
    #enable-spring-load-actions-on-all-items = true;
  };

  #system.defaults.menuextra = {
  #  clock = {
  #    DateFormat = "HH:mm";
  #    FlashDateSeparators = false;
  #  };
  #};
}
