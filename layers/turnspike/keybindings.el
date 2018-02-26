;;  (setq-default evil-escape-key-sequence "jk") ;; never gonna give you up
;;
;;  ;; -- move through softwrapped lines naturally
;;  ;;    https://stackoverflow.com/a/20899418/269247
;;  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
;;  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
;;  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
;;  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
;;  (setq-default evil-cross-lines t) ;; enable horizontal movement wrapping
;;
;;  ;; TODO I think the manual is wrong about the above...
;;  ;; http://spacemacs.org/doc/VIMUSERS.html
;;  ;; because: https://emacs.stackexchange.com/questions/14485/making-dj-delete-two-lines-in-evil-mode
;;  ;; https://github.com/syl20bnr/spacemacs/wiki/Beginner's-Guide-to-Contributing-a-Pull-Request-to-Spacemacs
;;
;;  ;; -- fix copy/paste from other apps
;;  ;; https://emacs.stackexchange.com/questions/14940/emacs-doesnt-paste-in-evils-visual-mode-with-every-os-clipboard/15054#15054
;;  (fset 'evil-visual-update-x-selection 'ignore)
;;
;;  (define-key evil-motion-state-map (kbd "M-h") #'evil-window-left)
;;  (define-key evil-motion-state-map (kbd "M-j") #'evil-window-down)
;;  (define-key evil-motion-state-map (kbd "M-k") #'evil-window-up)
;;  (define-key evil-motion-state-map (kbd "M-l") #'evil-window-right)
;;
;;  (define-key evil-motion-state-map (kbd "C-<left>") #'evil-window-left)
;;  (define-key evil-motion-state-map (kbd "C-<down>") #'evil-window-down)
;;  (define-key evil-motion-state-map (kbd "C-<up>") #'evil-window-up)
;;  (define-key evil-motion-state-map (kbd "C-<right>") #'evil-window-right)
;;
;;  ;; ;; -- delete into the black hole register instead of the killring
;;  ;; ;; helps when copying from and external app then pasting into smacs
;;  ;; ;; https://github.com/syl20bnr/spacemacs/issues/6977
;;  ;; (defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
;;  ;;   (apply orig-fn beg end type ?_ args))
;;  ;; (advice-add 'evil-delete :around 'bb/evil-delete)
