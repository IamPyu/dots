;; Packages
(quick-use-package rust-mode)
(quick-use-package lua-mode)
(quick-use-package go-mode)
;; (quick-use-package csharp-mode)

(quick-use-package linum-relative)

;; Casual settings
(add-hook 'prog-mode-hook 'menu-bar--display-line-numbers-mode-relative) ;; Relative line numbers

;; LSP
(use-package lsp-mode
  :straight t
  :ensure t
  :hook ((rust-mode lua-mode go-mode csharp-mode) . lsp))

;; Awesome languages
(quick-use-package clojure-mode)
(quick-use-package cider)
(quick-use-package haskell-mode)
(quick-use-package nix-mode)

(provide 'languages)
