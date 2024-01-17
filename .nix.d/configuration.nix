{self, pkgs, ...}:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  imports = [
    ./modules/env.nix 
    ./modules/brew.nix 
    ./modules/osx.nix 
    ./modules/programming.nix
  ];

  services.nix-daemon.enable = true;

  # Nix settings
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/*rc that loads the nix-darwin environment.
  programs.zsh.enable = true;
  programs.bash.enable = true;
  programs.tmux.enable = true;
  
  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 4;
  # Shells
  environment.shells = [pkgs.zsh pkgs.bash];
  
  # Users
  users.users.mixer = {
    name = "mixer";
    home = "/Users/mixer";
    shell = pkgs.bash;
  };
}
