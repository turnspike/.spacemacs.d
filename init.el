;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration. You should not put any user code in this function besides modifying the variable values."

  (setq-default
   ;;dotspacemacs-configuration-layer-path '("~/.config/spacemacs/layers") ;; also looks in ~/.emacs.d/private
   dotspacemacs-configuration-layers ;; List of configuration layers to load
   '(
     (auto-completion :variables ;; TODO get autocompletion working nicely
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "fd"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip nil
                      auto-completion-enable-sort-by-usage nil)
     better-defaults
     (colors :variables
             colors-colorize-identifiers 'variables
             colors-enable-nyan-cat-progress-bar t
             ) ;; show color codes as actual colors
     dash ;; access dash docco with <SPC d d>
     emacs-lisp
     ;; evil-commentary
     git
     github
     gtags
     helm
     html
     imenu-list ;; show function drawer with <SPC b i>
     javascript
     ;;jekyll
     markdown
     (org :variables
          org-enable-github-support t
          org-projectile-file "TODOs.org")
     ;;orgwiki
     osx
     php
     ranger
     (ruby :variables
           ruby-enable-ruby-on-rails-support t
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'chruby
           ruby-test-runner 'rspec)
     ruby-on-rails
     spacemacs-layouts
     ;; (spacemacs-spaceline :location local)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'ansi-term
            shell-default-term-shell "/bin/bash")
     spell-checking
     syntax-checking
     version-control
     yaml
     )
   dotspacemacs-additional-packages '(all-the-icons mode-icons yafolding) ;; list of additional packages, can also put the configuration in `dotspacemacs/user-config'
   ;; dotspacemacs-frozen-packages '();; list of packages that cannot be updated
   dotspacemacs-excluded-packages '(vi-tilde-fringe) ;; list of packages that will not be installed and loaded
   ))

(defun dotspacemacs/init ()
  "init spacemacs, before layers configuration. Initialization function. This function is called at the very startup of Spacemacs initialization before layers configuration. You should not put any user code in there besides modifying the variable values."

  (setq-default
   dotspacemacs-active-transparency 90 ;; A value from the range (0..100)
   dotspacemacs-auto-resume-layouts nil ;; If non nil then the last auto saved layouts are resume automatically upon start. (default nil)
   dotspacemacs-check-for-update t ;; running on develop branch so check for updates frequently
   dotspacemacs-default-font '("Source Code Pro" :size 14 :weight normal :width normal :powerline-scale 1.1) ;; default font, or prioritized list of fonts. `powerline-scale' allows to quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-layout-name "default" ;; Name of the default layout (default "Default")
   ;; dotspacemacs-display-default-layout t ;; If non nil the default layout name is displayed in the mode-line. (default nil)
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
   dotspacemacs-maximized-at-startup t ;; If non nil the frame is maximized when Emacs starts up. ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil. ;; ((default nil)) (Emacs 24.4+ only)
   dotspacemacs-persistent-server t ;; always keep spacemacs running
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep") ;; (default '("ag" "pt" "ack" "grep"))
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
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(helm . "melpa-stable") package-pinned-packages)

  (setq exec-path-from-shell-check-startup-files nil) ;; don't warn about .bashrc env vars
  (setq custom-file "~/.config/spacemacs/custom.el") ;; store custom vars here to avoid cluttering up .spacemacs file

  (setq neo-mode-line-type 'none)
  (setq projectile-switch-project-action 'neotree-projectile-action)

  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code. This function is called at the very end of Spacemacs initialization after layers configuration. This is the place where most of your configurations should be done. Unless it is explicitly specified that a variable should be set before a package is loaded, you should place your code here."

  ;; (spacemacs/set-leader-keys "oc" 'org-capture)

  (setq-default evil-escape-key-sequence "jk") ;; never gonna give you up

  ;; -- move through softwrapped lines naturally
  ;;    https://stackoverflow.com/a/20899418/269247
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (setq-default evil-cross-lines t) ;; enable horizontal movement wrapping

  ;; TODO I think the manual is wrong about the above...
  ;; http://spacemacs.org/doc/VIMUSERS.html
  ;; because: https://emacs.stackexchange.com/questions/14485/making-dj-delete-two-lines-in-evil-mode
  ;; https://github.com/syl20bnr/spacemacs/wiki/Beginner's-Guide-to-Contributing-a-Pull-Request-to-Spacemacs

  ;; -- fix copy/paste from other apps
  ;; https://emacs.stackexchange.com/questions/14940/emacs-doesnt-paste-in-evils-visual-mode-with-every-os-clipboard/15054#15054
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; -- delete into the black hole register instead of the killring
  ;; helps when copying from and external app then pasting into smacs
  ;; https://github.com/syl20bnr/spacemacs/issues/6977
  (defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
    (apply orig-fn beg end type ?_ args))
  (advice-add 'evil-delete :around 'bb/evil-delete)

  ;; -- indenting
  (setq standard-indent 2)
  (setq c-basic-offset 2)
  (setq tab-width 2)

  ;; (setq spacemacs-centered-buffer-mode-max-content-width 1600)
  ;; -- configure programming modes
  (add-hook 'prog-mode-hook (lambda()
                              (setq c-basic-offset 2)
                              (modify-syntax-entry ?_ "w") ;; snake_case
                              (modify-syntax-entry ?- "w") ;; kebab-case
                              (modify-syntax-entry ?$ "w") ;; $variable
                              (modify-syntax-entry ?@ "w") ;; @variable
                              (rainbow-mode) ;; highlight matching brackets
                              ;; (spacemacs/toggle-centered-buffer-mode)
                              ))

  ;; -- autocomplete
  (global-company-mode t)
  ;; (spacemacs|defvar-company-backends php-mode python-mode)

  ;; -- hilight current line in insert mode
  (setq evil-insert-state-message nil)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-default)
  (global-hl-line-mode 1)
  ;; (set-face-attribute hl-line-face nil :underline nil)
  (add-hook 'evil-insert-state-entry-hook (lambda()
                                            ;;(set-face-attribute hl-line-face nil :underline t)
                                            (set-face-background 'hl-line "#C5EFD8")
                                            (set-face-background 'hl-line "#9CEFA9")
                                            (message " ")))

  (add-hook 'evil-insert-state-exit-hook (lambda()
                                           ;; (set-face-attribute hl-line-face nil :underline nil)
                                           (set-face-background 'hl-line "#EFEAE9")))

  ;; hybrid-mode-insert-state-exit-hook

  ;; -- nyanyanyan
  (setq nyan-animate-nyancat nil) ;; don't animate nyancat progress bar
  ;; (setq spacemacs-centered-buffer-mode t)

  ;; ;; customize documents
  ;; (setq spacemacs-space-doc-modificators
  ;;       '(center-buffer-mode
  ;;         org-kbd-face-remap
  ;;         resize-inline-images))

  ;; -- customize neotree
  (setq
   neo-banner-message nil
   neo-theme 'ascii
   ;; neo-theme 'icons
   neo-mode-line-type 'none
   neo-force-change-root t
   )

  ;; --  force hide neotree modeline
  ;; https://github.com/anmonteiro/dotfiles/blob/master/.emacs.d/customizations/setup-neotree.el
  (add-hook 'neotree-mode-hook
            (lambda ()
              (setq-local mode-line-format nil)
              (setq-local display-line-numbers nil)))

  ;; -- customize imenu
  (setq
   imenu-list-mode-line-format nil
   imenu-list-focus-after-activation nil
   )

  ;; -- customize terminals
  (add-hook 'eshell-mode-hook (lambda () (setq-local mode-line-format nil)))
  (add-hook 'term-mode-hook (lambda () (setq-local mode-line-format nil)))

  ;; -- display the buffer name in the window title bar
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"))))

  ;; -- configure modeline
  (spacemacs/toggle-mode-line-minor-modes-off) ;; don't show minor mode info
  ;; (spaceline/toggle-input-method-off) ;; don't change color depending on vim insert mode
  ;; (spaceline/toggle-buffer-encoding-abbrev-off) ;; don't display file encoding

  (spacemacs/toggle-aggressive-indent-globally-on)
  (global-highlight-parentheses-mode 1)
  (rainbow-delimiters-mode-enable)
  ;; (fringe-mode '(0 . 8)) ;; thicker window borders

  ;; -- ignore boring files
  (add-hook 'after-init-hook
            (lambda ()
              (add-to-list 'recentf-exclude "\\TAGS\\'")
              (add-to-list 'recentf-exclude "\\GPATH\\'")
              (add-to-list 'recentf-exclude (expand-file-name "~/.emacs.d/.cache")) t))

  ;; ;; -- configure projectile
  ;; ;; use ripgrep
  ;; ;; https://emacs.stackexchange.com/a/29200/9069

  ;; (setq projectile-enable-caching t)

  ;; ;; set rg arguments
  ;; ;; https://github.com/BurntSushi/ripgrep
  ;; (when (executable-find "rg")
  ;;   (progn
  ;;     (defconst modi/rg-arguments
  ;;       `("--line-number"                     ; line numbers
  ;;         "--smart-case"
  ;;         "--follow"                          ; follow symlinks
  ;;         "--mmap")                           ; apply memory map optimization when possible
  ;;       "Default rg arguments used in the functions in `projectile' package.")

  ;;     (defun modi/advice-projectile-use-rg ()
  ;;       "Always use `rg' for getting a list of all files in the project."
  ;;       (mapconcat 'identity
  ;;                  (append '("\\rg") ; used unaliased version of `rg': \rg
  ;;                          modi/rg-arguments
  ;;                          '("--null" ; output null separated results,
  ;;                            "--files")) ; get file names matching the regex '' (all files)
  ;;                  " "))

  ;;     (advice-add 'projectile-get-ext-command :override #'modi/advice-projectile-use-rg)))

  ;; -- display major mode with an icon
  ;; https://github.com/syl20bnr/spacemacs/issues/5632
  ;; (remove-hook 'helm-mode-hook 'mode-icons-mode)
  ;; (remove-hook 'helm-minibuffer-set-up-hook 'mode-icons-mode)
  (setq mode-icons-change-mode-name nil) ;; don't use icons in helm as it breaks alignment
  (spacemacs|do-after-display-system-init (mode-icons-mode)) ;; enable mode-icons-mode on startup

  ;; -- jekyll
  (defun jekyll-timestamp ()
    "Update existing date: timestamp on a Jekyll page or post."
    (interactive)
    (save-excursion (
		                 goto-char 1)
		                (re-search-forward "^date:")
		                (let ((beg (point)))
		                  (end-of-line)
		                  (delete-region beg (point)))
		                (insert (concat " " (format-time-string "%Y-%m-%d %H:%M:%S %z"))))
    )


  ;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; TODO customize ranger
  ;; (use-package dired-ranger
  ;;   :ensure t
  ;;   :bind (:map dired-mode-map
  ;;               ("W" . dired-ranger-copy)
  ;;               ("X" . dired-ranger-move)
  ;;               ("Y" . dired-ranger-paste)))

  ;; https://github.com/syl20bnr/spacemacs/issues/8453
  ;; ;; based on neotree-show
  ;; (defun my-neotree-dir (dir)
  ;;   (let ((cw (selected-window))) ;; save current window
  ;;     (neotree-find dir)
  ;;     (neo-global--select-window)
  ;;     (selected-window cw)
  ;;     (neo-global--get-buffer))
  ;;   (add-to-list 'find-directory-functions 'my-neotree-dir)

  ;; TODO word wrap mode to autoupdate on <c-+>
  ;; TODO turn off bloody autobracketing
  ;; TODO gp should select most recently pasted text
  ;; TODO learn vim commands for navigating edit stack/marks
  ;; TODO underline on insert mode
  ;; TODO auto enter insert mode on window focus
  ;; https://emacs.stackexchange.com/questions/18670/turning-relative-numbering-on-with-linum-relative-in-spacemacs-only-when-in-no

  ;; TODO highlighting a block then pasting should overwrite visual selection
  ;; TODO commenting blocks with <spc-;> should also comment blank lines
  ;; TODO set magit to hardwrap commit msgs at 72c
  ;; git-commit-setup-hook
  ;; https://magit.vc/manual/magit/Editing-commit-messages.html
  ;; (add-hook 'text-mode-hook 'enable-hard-wrap)
  ;; (add-hook 'prog-mode-hook 'enable-comment-hard-wrap)
  ;; https://github.com/magit/magit/issues/3068
  ;; https://emacs.stackexchange.com/questions/32603/turn-on-auto-fill-mode-when-editing-a-commit-message-with-magit/32610

  ;; TODO log file highlighting
  ;; TODO add minimap layer
  ;; https://github.com/lahorichargha/emacs-minimap/blob/master/minimap.el

  ;; TODO fix defaults not getting set in core
  ;; eg dotspacemacs-emacs-command-key "SPC" throws an error if removed, should default to "SPC"

  ;; TODO add :delmarks! function to core
  ;; TODO port vim-peekaboo <spc-r-r>


  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete yaml-mode yafolding xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights uuidgen use-package unfill toc-org tagedit symon string-inflection spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv ranger rainbow-mode rainbow-identifiers rainbow-delimiters pug-mode projectile-rails popwin phpunit phpcbf php-extras php-auto-yasnippets persp-mode pbcopy password-generator paradox ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets org-brain open-junk-file neotree mwim multi-term move-text mode-icons mmm-mode minitest markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode linum-relative link-hint launchctl json-mode js2-refactor js-doc info+ indent-guide impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-ag google-translate golden-ratio gnuplot github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help enh-ruby-mode emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode diff-hl dash-at-point column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode chruby bundler browse-at-remote auto-highlight-symbol auto-dictionary auto-compile all-the-icons aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;### (autoloads nil nil ("../.emacs.d/elpa/ac-php-core-20171011.2355/ac-php-comm-tags-data.el"
;;;;;;  "../.emacs.d/elpa/ac-php-core-20171011.2355/ac-php-core-autoloads.el"
;;;;;;  "../.emacs.d/elpa/ac-php-core-20171011.2355/ac-php-core-pkg.el"
;;;;;;  "../.emacs.d/elpa/ac-php-core-20171011.2355/ac-php-core.el"
;;;;;;  "../.emacs.d/elpa/auto-complete-20170124.1845/auto-complete-autoloads.el"
;;;;;;  "../.emacs.d/elpa/auto-complete-20170124.1845/auto-complete-config.el"
;;;;;;  "../.emacs.d/elpa/auto-complete-20170124.1845/auto-complete-pkg.el"
;;;;;;  "../.emacs.d/elpa/auto-complete-20170124.1845/auto-complete.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-abbrev.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-autoloads.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-bbdb.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-capf.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-clang.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-cmake.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-css.el" "../.emacs.d/elpa/company-20171006.1442/company-dabbrev-code.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-dabbrev.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-eclim.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-elisp.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-etags.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-files.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-gtags.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-ispell.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-keywords.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-nxml.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-oddmuse.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-pkg.el" "../.emacs.d/elpa/company-20171006.1442/company-semantic.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-template.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-tempo.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-tng.el" "../.emacs.d/elpa/company-20171006.1442/company-xcode.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company-yasnippet.el"
;;;;;;  "../.emacs.d/elpa/company-20171006.1442/company.el") (0 0
;;;;;;  0 0))

;;;***
