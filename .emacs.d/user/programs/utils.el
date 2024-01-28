;; Utilites

(defun scratch-clojure ()
  (interactive)
  (find-file (concat user-emacs-directory ".cache/scratch.clj"))
  (cider-jack-in-clj ()))
