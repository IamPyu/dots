;; Packages
(use-package tree-sitter
  :straight t
  :ensure t
  :config
  (quick-use-package tree-sitter-langs)
  (global-tree-sitter-mode))

(quick-use-package rust-mode)
(quick-use-package lua-mode)
(quick-use-package go-mode)

;; Casual settings
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; LSP
(use-package eglot
  :straight t
  :ensure t
  :hook ((rust-mode lua-mode go-mode) . eglot-ensure))

;; Awesome languages
(quick-use-package clojure-mode)
(quick-use-package cider)
(quick-use-package haskell-mode)
(quick-use-package nix-mode)

(provide 'languages)
