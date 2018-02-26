(setq exec-path-from-shell-check-startup-files nil) ;; don't warn about .bashrc env vars
(setq custom-file "~/.spacemacs.d/custom.el") ;; store custom vars here to avoid cluttering up .spacemacs file

;; -- customize neotree
(setq
 neo-banner-message nil
 neo-theme 'ascii
 neo-theme 'icons
 neo-mode-line-type 'none
 neo-force-change-root t
 )

(setq projectile-switch-project-action 'neotree-projectile-action)
;;(spacemacs/load-theme 'gruvbox)
;;(load-theme 'gruvbox-dark-medium)
