(add-to-list 'load-path (expand-file-name "~/.emacs.d/user/"))
(setq roswell-helper (expand-file-name "~/.roswell/helper.el"))
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

(when (file-exists-p custom-file)
  (load-file custom-file))
(when (file-exists-p roswell-helper)
  (load-file roswell-helper))

;; exec paths
(defun add-exec-path (p)
  (add-to-list 'exec-path (expand-file-name p)))

(add-exec-path "~/.cargo/bin")
(add-exec-path "~/.ghcup/bin")
(add-exec-path "~/.roswell/bin")
(add-exec-path "/run/current-system/sw/bin")
(add-exec-path "/opt/homebrew/bin")

;; Get rid of annoying backup files
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default create-lockfiles nil)

;; Some more options
;;(setq tab-always-indent 'complete)

;; Useful alias
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'plugs)
(require 'languages)
(require 'keybinds)
(require 'theme)
