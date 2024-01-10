(quick-use-package nix-mode)
(quick-use-package rust-mode)
(quick-use-package haskell-mode)
(quick-use-package lua-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package tree-sitter
  :straight t
  :ensure t
  :config
  (quick-use-package tree-sitter-langs)
  (global-tree-sitter-mode))

(use-package eglot
  :straight t
  :ensure t
  :hook ((rust-mode lua-mode haskell-mode) . eglot-ensure))

(provide 'languages)
