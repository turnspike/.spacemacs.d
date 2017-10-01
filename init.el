;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration. You should not put any user code in this function besides modifying the variable values."

  (setq-default
   ;;dotspacemacs-configuration-layer-path '("~/.config/spacemacs/layers") ;; also looks in ~/.emacs.d/private
   dotspacemacs-configuration-layers ;; List of configuration layers to load
   '(
     auto-completion
     better-defaults
     (colors :variables
             colors-colorize-identifiers 'variables
             colors-enable-nyan-cat-progress-bar t
             ) ;; show color codes as actual colors
     dash ;; access dash docco with <SPC d d>
     emacs-lisp
     evil-commentary
     git
     github
     helm
     html
     javascript
     ;;jekyll
     markdown
     (org :variables
          org-enable-github-support t
          org-projectile-file "TODOs.org")
     ;;orgwiki
     osx
     ranger
     (ruby :variables
           ruby-enable-ruby-on-rails-support t
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'chruby
           ruby-test-runner 'rspec)
     ruby-on-rails
     spacemacs-layouts
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'ansi-term)
     spell-checking
     syntax-checking
     version-control
     yaml
     )
   ;; dotspacemacs-additional-packages '() ;; list of additional packages, can also put the configuration in `dotspacemacs/user-config'
   ;; dotspacemacs-frozen-packages '() ;; list of packages that cannot be updated
   dotspacemacs-excluded-packages '(vi-tilde-fringe) ;; list of packages that will not be installed and loaded
   ))

(defun dotspacemacs/init ()
  "init spacemacs, before layers configuration. Initialization function. This function is called at the very startup of Spacemacs initialization before layers configuration. You should not put any user code in there besides modifying the variable values."

  (setq-default
   dotspacemacs-active-transparency 90 ;; A value from the range (0..100)
   dotspacemacs-auto-resume-layouts t ;; If non nil then the last auto saved layouts are resume automatically upon start. (default nil)
   dotspacemacs-check-for-update t ;; running on develop branch so check for updates frequently
   dotspacemacs-default-font '("Source Code Pro" :size 14 :weight normal :width normal :powerline-scale 1.1) ;; default font, or prioritized list of fonts. `powerline-scale' allows to quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-layout-name "default" ;; Name of the default layout (default "Default")
   dotspacemacs-display-default-layout t ;; If non nil the default layout name is displayed in the mode-line. (default nil)
   dotspacemacs-editing-style 'vim ;; one of `vim', `emacs' or `hybrid', default 'vim
   dotspacemacs-elpa-https nil ;; use https, default t
   dotspacemacs-elpa-timeout 5 ;; maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-emacs-command-key "SPC" ;; the key used for Emacs commands (M-x) (after pressing on the leader key). (default "SPC")
   dotspacemacs-emacs-leader-key "M-m" ;; The leader key accessible in `emacs state' and `insert state' (default "M-m")
   dotspacemacs-fullscreen-use-non-native t ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen. ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-inactive-transparency 20
   dotspacemacs-large-file-size 1 ;; Size (in MB) above which spacemacs will prompt to open the large file literally to avoid performance issues (no major or minor modes)
   dotspacemacs-leader-key "SPC" ;; the leader key
   dotspacemacs-line-numbers nil ;; Control line numbers activation. ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and ;; `text-mode' derivatives. If set to `relative', line numbers are relative. ;; (default nil)
   dotspacemacs-maximized-at-startup t ;; If non nil the frame is maximized when Emacs starts up. ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil. ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep") ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-startup-lists '((recents . 5) (projects . 7)) ;; possible values for list-type are:; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-themes '(spacemacs-light spacemacs-dark) ;; list of themes, the first of the list is loaded when spacemacs starts. <SPC> T n to cycle to the next theme in the list (works great with 2 themes variants, one dark and one light)
   dotspacemacs-which-key-delay 0.4 ;; the commands bound to the current keystroke sequence. (default 0.4)
   ;;dotspacemacs-ex-substitute-global nil ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command. ;; (default nil)
   ;;dotspacemacs-fullscreen-at-startup nil ;; If non nil the frame is fullscreen when Emacs starts up. (default nil) ;; (Emacs 24.4+ only)
   ;;dotspacemacs-major-mode-leader-key "," ;; Major mode leader key is a shortcut key which is the equivalent of pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   ;;dotspacemacs-verbose-loading nil ;; if non nil output loading progress in `*Messages*' buffer, default nil
   dotspacemacs-whitespace-cleanup "changed"
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code. It is called immediately after `dotspacemacs/init', before layer configuration executes. This function is mostly useful for variables that need to be set before packages are loaded. If you are unsure, you should try in setting them in `dotspacemacs/user-config' first."

  ;; -- only update from stable packages (otherwise can break smacs)
  ;;    workaround for https://github.com/syl20bnr/spacemacs/issues/9549
  ;;    run this after adding: rm -rf ~/.emacs.d/elpa/*
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '(helm . "melpa-stable") package-pinned-packages)

  (setq exec-path-from-shell-check-startup-files nil) ;; don't warn about .bashrc env vars
  (setq custom-file "~/.config/spacemacs/custom.el") ;; store custom vars here to avoid cluttering up .spacemacs file

  (setq projectile-switch-project-action 'neotree-projectile-action)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code. This function is called at the very end of Spacemacs initialization after layers configuration. This is the place where most of your configurations should be done. Unless it is explicitly specified that a variable should be set before a package is loaded, you should place your code here."

  ;; -- move through softwrapped lines naturally
  ;;    https://stackoverflow.com/a/20899418/269247
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (setq-default evil-cross-lines t) ;; enable horizontal movement wrapping

  ;; -- don't use macos system clipboard
  ;; paste from Safari using "+p
  ;; https://stackoverflow.com/questions/26472216/how-to-copy-text-in-emacs-evil-mode-without-overwriting-the-clipboard
  ;; https://github.com/syl20bnr/spacemacs/issues/2032
  ;; https://github.com/syl20bnr/spacemacs/issues/5750
  ;; https://github.com/syl20bnr/spacemacs/pull/9344
  (setq save-interprogram-paste-before-kill t)
  (setq x-select-enable-clipboard nil)
  (fset 'evil-visual-update-x-selection 'ignore)
  ;; (define-key evil-visual-state-map (kbd "s-c") (kbd "\"+y"))
  ;; (define-key evil-insert-state-map  (kbd "s-v") (kbd "+"))
  ;; (define-key evil-ex-completion-map (kbd "s-v") (kbd "+"))
  ;; (define-key evil-ex-search-keymap  (kbd "s-v") (kbd "+"))

  (add-hook 'prog-mode-hook 'rainbow-mode) ;; enable rainbow mode by default

  (setq nyan-animate-nyancat nil) ;; don't animate nyancat progress bar

  ;; TODO I think the manual is wrong about the above...
  ;; http://spacemacs.org/doc/VIMUSERS.html
  ;; because: https://emacs.stackexchange.com/questions/14485/making-dj-delete-two-lines-in-evil-mode

  ;; TODO set magit to hardwrap commit msgs at 72c
  ;; https://github.com/magit/magit/issues/3068
  ;; https://emacs.stackexchange.com/questions/32603/turn-on-auto-fill-mode-when-editing-a-commit-message-with-magit/32610

  ;; TODO add minimap layer
  ;; https://github.com/lahorichargha/emacs-minimap/blob/master/minimap.el

  )
