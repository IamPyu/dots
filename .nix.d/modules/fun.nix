{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    minetest
  ];
}
