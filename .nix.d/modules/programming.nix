{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # languages
    rustup # rust
    ghc cabal-install # haskell
    clang gnumake cmake # c/c++
    roswell clojure leiningen # lisp-like languages
    perl luajit # scripting languages
    zig zls # zig
    nodejs # jAvaSCrIpT
    zsh # shell script

    # editors and terminal emulators
    neovim
    emacs
    kitty
    alacritty

    # tools and libraries
    pkg-config
    git
    libiconv
    libtool
    tree-sitter
    qemu
  ]; 
}
