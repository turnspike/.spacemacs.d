;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables ;; TODO get autocompletion working nicely
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      ;; auto-completion-complete-with-key-sequence "fd"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      ;; auto-completion-enable-snippets-in-popup f
                      ;; auto-completion-private-snippets-directory nil
                      ;; auto-completion-enable-help-tooltip nil
                      auto-completion-enable-sort-by-usage nil)
     better-defaults
     clojure
     (colors :variables
             colors-colorize-identifiers 'variables
             colors-enable-nyan-cat-progress-bar t
             ) ;; show color codes as actual colors
     deft
     (elfeed :variables rmh-elfeed-org-files (list "~/.spacemacs.d/layers/turnspike/elfeed.org"))
     html
     ivy
     ;; auto-completion
     emacs-lisp
     git
     imenu-list
     markdown
     org
     react
     (ruby :variables
           ruby-enable-ruby-on-rails-support t
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'chruby
           ) ;;ruby-test-runner 'rspec)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     syntax-checking
     turnspike
     (treemacs :variables treemacs-use-follow-mode t)
     twitter
     version-control
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(all-the-icons)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         doom-one
                         doom-one-light
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'all-the-icons
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup "changed"
   ))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (my-setup-indent 2) ; indent 2 spaces width

  (setq exec-path-from-shell-check-startup-files nil) ;; don't warn about .bashrc env vars
  (when (and (display-graphic-p) (eq system-type 'darwin))
    (with-eval-after-load 'exec-path-from-shell
      (exec-path-from-shell-setenv "SHELL" "/bin/bash"))) ;; always use bash as shell

  ;; (when (system-type "darwin")
  ;;   (setq dired-use-ls-dired nil))

  (when (eq system-type 'darwin)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil))

  (setq custom-file "~/.spacemacs.d/custom.el") ;; store custom vars here to avoid cluttering up .spacemacs file
  ;; (spacemacs/set-leader-keys "oc" 'org-capture)

  (setq-default evil-escape-key-sequence "jk") ;; never gonna give you up
  (setq-default evil-cross-lines t) ;; enable horizontal movement wrapping
  ;; does it bother you that the cursor creeps back when you go back to normal mode?
  (setq evil-move-cursor-back nil)

  (with-eval-after-load 'evil-maps

    ;; -- move through softwrapped lines naturally
    ;;    https://stackoverflow.com/a/20899418/269247
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

    ;; TODO I think the manual is wrong about the above...
    ;; http://spacemacs.org/doc/VIMUSERS.html
    ;; because: https://emacs.stackexchange.com/questions/14485/making-dj-delete-two-lines-in-evil-mode
    ;; https://github.com/syl20bnr/spacemacs/wiki/Beginner's-Guide-to-Contributing-a-Pull-Request-to-Spacemacs

    (define-key evil-motion-state-map (kbd "M-h") #'evil-window-left)
    (define-key evil-motion-state-map (kbd "M-j") #'evil-window-down)
    (define-key evil-motion-state-map (kbd "M-k") #'evil-window-up)
    (define-key evil-motion-state-map (kbd "M-l") #'evil-window-right)

    (define-key evil-motion-state-map (kbd "C-<left>") #'evil-window-left)
    (define-key evil-motion-state-map (kbd "C-<down>") #'evil-window-down)
    (define-key evil-motion-state-map (kbd "C-<up>") #'evil-window-up)
    (define-key evil-motion-state-map (kbd "C-<right>") #'evil-window-right)

    (define-key evil-motion-state-map (kbd "C-e") #'evil-end-of-line)
    (define-key evil-motion-state-map (kbd "C-a") #'evil-beginning-of-line)

    ;; -- fix copy/paste from other apps
    ;; https://emacs.stackexchange.com/questions/14940/emacs-doesnt-paste-in-evils-visual-mode-with-every-os-clipboard/15054#15054
    (fset 'evil-visual-update-x-selection 'ignore)

    )


  ;; ;; -- delete into the black hole register instead of the killring
  ;; ;; helps when copying from and external app then pasting into smacs
  ;; ;; https://github.com/syl20bnr/spacemacs/issues/6977
  ;; (defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
  ;;   (apply orig-fn beg end type ?_ args))
  ;; (advice-add 'evil-delete :around 'bb/evil-delete)

  ;; FIXME this doesn't work
  ;; -- select most recently pasted text
  ;; (defun evil-select-pasted ()
  ;;   "Visually select last pasted text."
  ;;   (interactive)
  ;;   (let ((start-marker (evil-get-marker ?[))
  ;;                       (end-marker (evil-get-marker ?])))
  ;;     (evil-visual-select start-marker end-marker))

  ;;   ;; (interactive)
  ;;   ;; (evil-goto-mark ?[)
  ;;   ;;                 (evil-visual-char)
  ;;   ;;                 (evil-goto-mark ?])

  ;;   )

  ;; (define-key evil-normal-state-map "gp" 'evil-select-pasted)
  (global-set-key (kbd "M-<down>") 'scroll-down-command)
  (global-set-key (kbd "M-<up>") 'scroll-up-command)

  ;; ;; -- indenting
  ;; (setq standard-indent 2)
  ;; (setq c-basic-offset 2)
  ;; (setq tab-width 2)

  ;; (setq spacemacs-centered-buffer-mode-max-content-width 1600)
  ;; -- configure programming modes
  (add-hook 'prog-mode-hook (lambda()
                              (setq c-basic-offset 2) ;; tab is two spaces
                              (modify-syntax-entry ?_ "w") ;; snake_case
                              (modify-syntax-entry ?- "w") ;; kebab-case
                              (modify-syntax-entry ?$ "w") ;; $variable
                              (modify-syntax-entry ?@ "w") ;; @variable
                              ;; (rainbow-mode) ;; highlight matching brackets
                              ;; (spacemacs/toggle-centered-buffer-mode)
                              ))

  ;; -- autocomplete FIXME
  ;; (global-company-mode t)
  ;; (spacemacs|defvar-company-backends php-mode python-mode)

  ;; -- hilight current line in insert mode
  (setq evil-insert-state-message nil)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-default)
  ;; (global-hl-line-mode 1)
  ;; (set-face-attribute hl-line-face nil :underline nil)
  ;; (set-face-background 'hl-line "#D9D8D2")
  (set-face-attribute 'region nil :background "#FAC023")
  ;; (setq evil-visual-state-cursor '("#cb4b16" box))     ; orange
  (setq dotspacemacs-auto-resume-layouts t)
  (add-hook 'evil-insert-state-entry-hook (lambda()
                                            ;;(set-face-attribute hl-line-face nil :underline t)
                                            (set-face-background 'hl-line "#C5EFD8")
                                            (set-face-background 'hl-line "#9CEFA9")
                                            ))

  (add-hook 'evil-insert-state-exit-hook (lambda()
                                           ;; (set-face-attribute hl-line-face nil :underline nil)
                                           (set-face-background 'hl-line "#D9D8D2")
                                           ))

  (setq org-agenda-files '("~/gdrive/org/todo.org"
                           "~/gdrive/org/tickler.org"))

  ;; (setq org-capture-templates '(("t" "Todo [inbox]" entry
  ;;                                (file+headline "~/gdrive/gtd/inbox.org" "Tasks")
  ;;                                "* TODO %i%?")
  ;;                               ("T" "Tickler" entry
  ;;                                (file+headline "~/gdrive/gtd/tickler.org" "Tickler")
  ;;                                "* %i%? \n %U")))

  ;; (setq org-refile-targets '(("~/gdrive/gtd/gtd.org" :maxlevel . 3)
  ;;                            ("~/gdrive/gtd/someday.org" :level . 1)
  ;;                            ("~/gdrive/gtd/tickler.org" :maxlevel . 2)))

  (setq org-todo-keywords '((sequence "TODO(t)" "DOING(d)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  ;; -- escape always escapes
  ;;  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  ;;  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  ;;  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  ;;  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  ;;  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; -- smartparens smackdown

  ;; ;; (spacemacs/toggle-smartparens-globally-off)
  ;; (eval-after-load 'smartparens
  ;;   '(progn
  ;;      (sp-pair "(" nil :actions '(:rem insert))
  ;;      (sp-pair "[" nil :actions '(:rem insert))
  ;;      (sp-pair "'" nil :actions '(:rem insert))
  ;;      (sp-pair "\"" nil :actions '(:rem insert))
  ;;      (sp-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))
  ;;      )
  ;;   )

  ;; -- nyanyanyan
  (setq nyan-animate-nyancat nil) ;; don't animate nyancat progress bar
  ;; (setq spacemacs-centered-buffer-mode t)

  ;; ;; customize documents
  ;; (setq spacemacs-space-doc-modificators
  ;;       '(center-buffer-mode
  ;;         org-kbd-face-remap
  ;;         resize-inline-images))
  ;; ;; -- customize imenu
  ;; (setq
  ;;  imenu-list-mode-line-format nil
  ;;  imenu-list-focus-after-activation nil
  ;;  )

  ;; -- customize terminals
  (add-hook 'eshell-mode-hook (lambda () (setq-local mode-line-format nil)))
  (add-hook 'term-mode-hook (lambda () (setq-local mode-line-format nil)))

  ;; -- display the buffer name in the window title bar
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"))))

  ;; -- configure modeline
  ;; (spacemacs/toggle-mode-line-minor-modes-off) ;; don't show minor mode info
  ;; (spaceline/toggle-input-method-off) ;; don't change color depending on vim insert mode
  ;; (spaceline/toggle-buffer-encoding-abbrev-off) ;; don't display file encoding

  ;; (spacemacs/toggle-aggressive-indent-globally-on)
  ;; (global-highlight-parentheses-mode 1)
  ;; (rainbow-delimiters-mode-enable)
  ;; (fringe-mode '(0 . 8)) ;; thicker window borders

  ;; -- ignore boring files
  ;; FIXME this doesn't work
  ;; (add-hook 'after-init-hook
  ;;           (lambda ()
  ;;             (add-to-list recentf-exclude '("^/var/folders\\.*"
  ;;                                            "COMMIT_EDITMSG\\'"
  ;;                                            ".*-autoloads\\.el\\'"
  ;;                                            "[/\\]\\.elpa/"
  ;;                                            "^.*TAGS$"
  ;;                                            "^.*GPATH$"
  ;;                                            (expand-file-name "~/.emacs.d/.cache")
  ;;                                            ))

  ;;             ;; (add-to-list 'recentf-exclude "^.*TAGS$")

  ;;             t))

  ;; ;; -- configure projectile
  ;; ;; use ripgrep
  ;; ;; https://emacs.stackexchange.com/a/29200/9069

  (setq projectile-enable-caching t)

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
  ;; 
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
  ;; (setq mode-icons-change-mode-name nil) ;; don't use icons in helm as it breaks alignment
  ;; (spacemacs|do-after-display-system-init (mode-icons-mode)) ;; enable mode-icons-mode on startup

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

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
