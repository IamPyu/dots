(defgroup hello-app nil
  "Hello app configurations"
  :prefix "hello-"
  :group 'games)

(defcustom hello-msg "hello world"
  "Message for hello app"
  :group 'hello-mode
  :type 'string)

(defun hello ()
  (interactive)
  (message-box "%s" hello-msg))

(define-minor-mode hello-mode
  "Hello mode! Just a simple game."
  :global nil
  :group 'hello-mode
  :lighter " hello"
  :keymap
  (list (cons (kbd "C-c C-h") 'hello)))

(provide 'hello)
