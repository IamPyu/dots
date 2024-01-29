;; Disable annoying backup files and autosaves
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default create-lockfiles nil)

;; Enable mouse in terminal mode
(when (not (display-graphic-p))
  (xterm-mouse-mode 1))

;; Disable scroll bars in GUI mode
(when (display-graphic-p)
  (scroll-bar-mode -1))

;; Hide the menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Frame settings
(set-frame-name "GNU Emacs")
(set-frame-font "iosevka-18")

(add-to-list 'after-make-frame-functions 'setup-frame)

;; Display line numbers in programming language modes
(add-hook 'prog-mode-hook 'menu-bar--display-line-numbers-mode-visual)

;; Alias to yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; Themeing
(require 'plugins)

(package! spaceline (spaceline-emacs-theme))
(package! zenburn-theme)
(package! gruber-darker-theme)

(load-theme 'gruber-darker t)

;; Keybinds
(global-set-key (kbd "<C-SPC>") 'company-complete)

(provide 'options)
