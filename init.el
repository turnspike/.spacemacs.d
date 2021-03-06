;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(php
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
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
     ;; clojure
     ;; (clojure :variables
     ;;          clojure-enable-linters 'clj-kondo)
     (colors :variables
             colors-colorize-identifiers 'variables
             colors-enable-nyan-cat-progress-bar t
             ) ;; show color codes as actual colors
     deft
     ;; (elfeed :variables rmh-elfeed-org-files (list "~/.spacemacs.d/layers/turnspike/elfeed.org"))
     ;; flycheck
     ;; flycheck-clj-kondo
     html
     ivy
     auto-completion
     emacs-lisp
     git
     imenu-list
     markdown
     multiple-cursors
     ;; org
     osx
     ;;react
     (ruby :variables
           ruby-enable-ruby-on-rails-support t
           ruby-enable-enh-ruby-mode t
           ;; ruby-version-manager 'chruby
           ruby-version-manager 'rbenv
           ) ;;ruby-test-runner 'rspec)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     syntax-checking
     ;;terraform
     (treemacs :variables treemacs-use-follow-mode t)
     turnspike
     twitter
     version-control
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   ;; dotspacemacs-additional-packages '(all-the-icons simpleclip)
   dotspacemacs-additional-packages '(all-the-icons)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :POWERLINE-SCALE 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   ;; dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

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
  ;; (simpleclip-mode 1)

  (setq exec-path-from-shell-check-startup-files nil) ;; don't warn about .bashrc env vars


  ;; -- macos tweaks

  (when (and (display-graphic-p) (eq system-type 'darwin))
    (with-eval-after-load 'exec-path-from-shell
      (exec-path-from-shell-setenv "SHELL" "/bin/bash"))) ;; always use bash as shell

  (when (eq system-type 'Darwin)
    (setq dired-use-ls-dired nil)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil))

  (setq custom-file "~/.spacemacs.d/custom.el") ;; store custom vars here to avoid cluttering up .spacemacs file

  ;; (server-start)

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

  ;; (with-eval-after-load 'org

  ;;   (setq org-agenda-files '("~/gdrive/org/inbox.org"
  ;;                            "~/gdrive/org/work.org"
  ;;                            "~/gdrive/org/personal.org"
  ;;                            "~/gdrive/org/tickler.org"))

  ;;   (setq org-refile-targets '(("~/gdrive/org/work.org" :maxlevel . 3)
  ;;                              ;; ("~/gdrive/org/work-backlog.org" :level . 1)
  ;;                              ("~/gdrive/org/personal.org" :level . 3)
  ;;                              ("~/gdrive/org/personal-backlog.org" :level . 1)
  ;;                              ("~/gdrive/org/tickler.org" :maxlevel . 2)))

  ;;   (setq org-capture-templates '(("t" "Todo [inbox]" entry
  ;;                                  (file+headline "~/gdrive/org/inbox.org" "Inbox")
  ;;                                  "* TODO %i%?")
  ;;                                 ("T" "Tickler" entry
  ;;                                  (file+headline "~/gdrive/org/tickler.org" "Tickler")
  ;;                                  "* %i%? \n %U")))

  ;;   (spacemacs/set-leader-keys "oc" 'org-capture)
  ;;   (setq org-tag-alist '(("@project" . ?p) ("@urgent" . ?u) ("@coding" . ?c) ("@dship" . ?d) ("@beats" . ?b)))
  ;;   (setq org-todo-keywords '((sequence "BACKLOG(b)" "TODO(t)" "DOING(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  ;;   (setq org-agenda-custom-commands
  ;;         '(("p" "Projects" tags-todo "@projects"
  ;;            ((org-agenda-overriding-header "Projects")
  ;;             (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))

  ;;   (defun my-org-agenda-skip-all-siblings-but-first ()
  ;;     "Skip all but the first non-done entry."
  ;;     (let (should-skip-entry)
  ;;       (unless (org-current-is-todo)
  ;;         (setq should-skip-entry t))
  ;;       (save-excursion
  ;;         (while (and (not should-skip-entry) (org-goto-sibling t))
  ;;           (when (org-current-is-todo)
  ;;             (setq should-skip-entry t))))
  ;;       (when should-skip-entry
  ;;         (or (outline-next-heading)
  ;;             (goto-char (point-max))))))

  ;;   (defun org-current-is-todo ()
  ;;     (string= "TODO" (org-get-todo-state)))

    ;; )

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

  (setq flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop")

  ;; -- enable html-tidy mode for html files
  (eval-after-load 'flycheck
    '(flycheck-add-mode 'html-tidy 'web-mode))

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
  ;; (setq org-todo-keywords                                                                                        
  ;;       '((sequence "BACKLOG(t!)" "NEXT(n!)" "DOING(d!)" "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "TICKLE(T!)" "|" "CANCELLED(c!)" "DONE(F!)")))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
