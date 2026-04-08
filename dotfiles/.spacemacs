;; -*- mode: emacs-lisp -*-
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
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '
   (javascript
    vimscript
    ;; ----------------------------------------------------------------
    ;; Example of useful layers you may want to use right away.
    ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
    ;; <M-m f e R> (Emacs style) to install them.
    ;; ----------------------------------------------------------------
    ;; html
    ;; better-defaults
    ;; lsp
    auto-completion
    csv
    emacs-lisp
    ess
    git
    helm
    html
    markdown
    org
    osx
    python
    ;; pyvenv
    sql
    themes-megapack
    yaml
    ;; (shell :variables
    ;;        shell-default-height 30
    ;;        shell-default-position 'bottom)
    ;; spell-checking
    ;; syntax-checking
    ;; version-control
    )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      epc
                                      ctable
                                      concurrent
                                      ;; differed
                                      ;; python-environment
                                      jedi-core
                                      jedi
                                      direx
                                      jedi-direx
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
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
   dotspacemacs-remap-Y-to-y$ t
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
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq dotspacemacs-themes '(cyberpunk))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (let ((default-directory  "~/.emacs.d/lisp/"))
    (normal-top-level-add-subdirs-to-load-path)
    )

  (setq org-startup-with-inline-images t)
  ;; TODO nick's attempt at installing tsv-mode
  ;; (add-to-list 'load-path "/path/to/lib")
  ;; (autoload 'tsv-mode "tsv-mode" "A mode to edit table like file" t)
  ;; (autoload 'tsv-normal-mode "tsv-mode" "A minor mode to edit table like file" t)

  ;; ORG-MODE
  (setq org-ellipsis "▼");⤵, ▼, ↴, ⬎, ⤷, ⋱
  (setq org-directory "~/notes/org")
  (setq org-agenda-files '("~/notes/org"))
  (setq-default org-download-image-dir "~/notes/org/images")
  (setq org-html-validation-link nil) ; remove "validate" link from bottom of html exports
  (setq org-startup-indented t)
  ;; (setq org-indent-mode t)
  ;; Resume clocking task when emacs is restarted
  ;; (org-clock-persistence-insinuate)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  ;; (setq org-clock-persist t)
  ;; use pretty things for the clocktable
  (setq org-pretty-entities t)

  ;; 6-VIM
  (define-key evil-normal-state-map "H" 'beginning-of-line-text)
  (define-key evil-visual-state-map "H" 'beginning-of-line-text)
  (define-key evil-normal-state-map "L" 'end-of-line)
  (define-key evil-visual-state-map "L" 'end-of-line)
  (define-key evil-normal-state-map "q" 'evil-quit)
  (define-key evil-normal-state-map "s" 'evil-write)
  (define-key evil-normal-state-map "f" 'evil-toggle-fold)
  ;; from: https://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
  (setq make-backup-files nil)
  (setq evil-move-cursor-back nil)
  (setq evil-ex-search-vim-style-regexp t)

  ;; from http://tuhdo.github.io/helm-intro.html
  ;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  ;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  ;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  ;; (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x


  ;; (setq ace-jump-word-mode-use-query-char nil)
  ;; (evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
  ;; (spacemacs/declare-prefix "o" "user-prefix")
  (spacemacs/set-leader-keys "jw" 'avy-goto-word-0)
  (spacemacs/set-leader-keys "jj" 'avy-goto-word-0)
  (spacemacs/set-leader-keys "ji" 'helm-imenu)
  (spacemacs/set-leader-keys "hb" 'helm-bookmarks)

  (add-hook 'python-mode-hook 'jedi:setup)
  (setq python-environment-directory "~/envs")
  (setq jedi:complete-on-dot t)
  ;; (setq jedi:environment-root "~/code/farmers-fridge/venv")
  (setq jedi:environment-root "~/envs/env1")

  (setq bookmark-default-file "~/.emacs.d/bookmarks"
        bookmark-save-flag 1
        ) ;; save after every change

  (autoload 'whitespace-mode           "whitespace"
    "Toggle whitespace visualization."        t)
  (autoload 'whitespace-toggle-options "whitespace"
    "Toggle local `whitespace-mode' options." t)

  ;; Clock report -> 8h days
  (use-package org-duration
    :config
    (customize-set-variable
     'org-duration-units
     `(("min" . 1)
       ("h" . 60)
       ("d" . ,(* 60 8))
       ("w" . ,(* 60 8 5))
       ("m" . ,(* 60 8 5 4))
       ("y" . ,(* 60 8 5 4 11)))))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (define-word zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler winum white-sand-theme which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme launchctl jedi-direx jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-data-view espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diminish darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-web company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(with-eval-after-load 'org
  ;; Replace org-set-tags with org-set-tags-command in keybinding
  (spacemacs/set-leader-keys-for-major-mode 'org-mode ":" 'org-set-tags-command)
  )

(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-safe-themes
     '("9b65cf71fd6b27a5362afeff062c6abd1c5d8a7c4d444c942f3da36bf0a151b1"
       "f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f"
       "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773"
       "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d"
       "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7"
       "d74183b099f4e91052941ef3131c76697caae3fcf581f4c140216a7c6e6d71e2"
       "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265"
       "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5"
       "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2"
       "2b3f1e6abe0f02ff73d95dca04901bdbc2ecebe80fa453eded34fa39c8b050cb"
       "032d5dc72a31ebde5fae25a8c1ef48bac6ba223588a1563d10dbf3a344423879"
       "6313eeb08a54045a6d3945c28ab5a97916334e189cebd9c67c8b72beed0de265"
       "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02"
       "e9a1226ffed627ec58294d77c62aa9561ec5f42309a1f7a2423c6227e34e3581"
       "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b"
       "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8"
       "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607"
       "3fec737266204a5422e5acc776ea55e1a2fcd3a8104fd8c70ee0a300e56ece3c"
       "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4"
       "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1"
       "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa"
       "13a15b35b4b50fd3e948f7445e15b286155bbfede5468df83426734840c0fba7"
       "ea5a840bd2f9616a36890c27fd5e97528cb9fcfafa0e6739315bb12786d6c4ee" default))
   '(org-ascii-headline-spacing '(0 . 1))
   '(org-ascii-text-width 120)
   '(org-duration-units
     '(("min" . 1) ("h" . 60) ("d" . 480) ("w" . 10080) ("m" . 43200)
       ("y" . 525960.0)))
   '(org-html-style-default
     "<style type=\"text/css\">\12  #content { max-width: 60em; margin: 0; }\12  .title  { text-align: center;\12             margin-bottom: 0; }\12  .subtitle { text-align: center;\12              font-size: medium;\12              font-weight: bold;\12              margin-top:0; }\12  .todo   { font-family: monospace; color: red; }\12  .done   { font-family: monospace; color: green; }\12  .priority { font-family: monospace; color: orange; }\12  .tag    { background-color: #eee; font-family: monospace;\12            padding: 2px; font-size: 80%; font-weight: normal; }\12  .timestamp { color: #bebebe; }\12  .timestamp-kwd { color: #5f9ea0; }\12  .org-right  { margin-left: auto; margin-right: 0px;  text-align: right; }\12  .org-left   { margin-left: 0px;  margin-right: auto; text-align: left; }\12  .org-center { margin-left: auto; margin-right: auto; text-align: center; }\12  .underline { text-decoration: underline; }\12  #postamble p, #preamble p { font-size: 90%; margin: 0em; }\12  p.verse { margin-left: 3%; }\12  pre {\12    border: 1px solid #e6e6e6;\12    border-radius: 0px;\12    background-color: #f2f2f2;\12    padding: 0pt;\12    font-family: monospace;\12    overflow: auto;\12    margin: 0;\12  }\12  pre.src {\12    position: relative;\12    overflow: auto;\12  }\12  pre.src:before {\12    display: none;\12    position: absolute;\12    top: -8px;\12    right: 12px;\12    padding: 3px;\12    color: #555;\12    background-color: #f2f2f299;\12  }\12  pre.src:hover:before { display: inline; margin-top: 0px;}\12  /* Languages per Org manual */\12  pre.src-asymptote:before { content: 'Asymptote'; }\12  pre.src-awk:before { content: 'Awk'; }\12  pre.src-authinfo::before { content: 'Authinfo'; }\12  pre.src-C:before { content: 'C'; }\12  /* pre.src-C++ doesn't work in CSS */\12  pre.src-clojure:before { content: 'Clojure'; }\12  pre.src-css:before { content: 'CSS'; }\12  pre.src-D:before { content: 'D'; }\12  pre.src-ditaa:before { content: 'ditaa'; }\12  pre.src-dot:before { content: 'Graphviz'; }\12  pre.src-calc:before { content: 'Emacs Calc'; }\12  pre.src-emacs-lisp:before { content: 'Emacs Lisp'; }\12  pre.src-fortran:before { content: 'Fortran'; }\12  pre.src-gnuplot:before { content: 'gnuplot'; }\12  pre.src-haskell:before { content: 'Haskell'; }\12  pre.src-hledger:before { content: 'hledger'; }\12  pre.src-java:before { content: 'Java'; }\12  pre.src-js:before { content: 'Javascript'; }\12  pre.src-latex:before { content: 'LaTeX'; }\12  pre.src-ledger:before { content: 'Ledger'; }\12  pre.src-lisp:before { content: 'Lisp'; }\12  pre.src-lilypond:before { content: 'Lilypond'; }\12  pre.src-lua:before { content: 'Lua'; }\12  pre.src-matlab:before { content: 'MATLAB'; }\12  pre.src-mscgen:before { content: 'Mscgen'; }\12  pre.src-ocaml:before { content: 'Objective Caml'; }\12  pre.src-octave:before { content: 'Octave'; }\12  pre.src-org:before { content: 'Org mode'; }\12  pre.src-oz:before { content: 'OZ'; }\12  pre.src-plantuml:before { content: 'Plantuml'; }\12  pre.src-processing:before { content: 'Processing.js'; }\12  pre.src-python:before { content: 'Python'; }\12  pre.src-R:before { content: 'R'; }\12  pre.src-ruby:before { content: 'Ruby'; }\12  pre.src-sass:before { content: 'Sass'; }\12  pre.src-scheme:before { content: 'Scheme'; }\12  pre.src-screen:before { content: 'Gnu Screen'; }\12  pre.src-sed:before { content: 'Sed'; }\12  pre.src-sh:before { content: 'shell'; }\12  pre.src-sql:before { content: 'SQL'; }\12  pre.src-sqlite:before { content: 'SQLite'; }\12  /* additional languages in org.el's org-babel-load-languages alist */\12  pre.src-forth:before { content: 'Forth'; }\12  pre.src-io:before { content: 'IO'; }\12  pre.src-J:before { content: 'J'; }\12  pre.src-makefile:before { content: 'Makefile'; }\12  pre.src-maxima:before { content: 'Maxima'; }\12  pre.src-perl:before { content: 'Perl'; }\12  pre.src-picolisp:before { content: 'Pico Lisp'; }\12  pre.src-scala:before { content: 'Scala'; }\12  pre.src-shell:before { content: 'Shell Script'; }\12  pre.src-ebnf2ps:before { content: 'ebfn2ps'; }\12  /* additional language identifiers per \"defun org-babel-execute\"\12       in ob-*.el */\12  pre.src-cpp:before  { content: 'C++'; }\12  pre.src-abc:before  { content: 'ABC'; }\12  pre.src-coq:before  { content: 'Coq'; }\12  pre.src-groovy:before  { content: 'Groovy'; }\12  /* additional language identifiers from org-babel-shell-names in\12     ob-shell.el: ob-shell is the only babel language using a lambda to put\12     the execution function name together. */\12  pre.src-bash:before  { content: 'bash'; }\12  pre.src-csh:before  { content: 'csh'; }\12  pre.src-ash:before  { content: 'ash'; }\12  pre.src-dash:before  { content: 'dash'; }\12  pre.src-ksh:before  { content: 'ksh'; }\12  pre.src-mksh:before  { content: 'mksh'; }\12  pre.src-posh:before  { content: 'posh'; }\12  /* Additional Emacs modes also supported by the LaTeX listings package */\12  pre.src-ada:before { content: 'Ada'; }\12  pre.src-asm:before { content: 'Assembler'; }\12  pre.src-caml:before { content: 'Caml'; }\12  pre.src-delphi:before { content: 'Delphi'; }\12  pre.src-html:before { content: 'HTML'; }\12  pre.src-idl:before { content: 'IDL'; }\12  pre.src-mercury:before { content: 'Mercury'; }\12  pre.src-metapost:before { content: 'MetaPost'; }\12  pre.src-modula-2:before { content: 'Modula-2'; }\12  pre.src-pascal:before { content: 'Pascal'; }\12  pre.src-ps:before { content: 'PostScript'; }\12  pre.src-prolog:before { content: 'Prolog'; }\12  pre.src-simula:before { content: 'Simula'; }\12  pre.src-tcl:before { content: 'tcl'; }\12  pre.src-tex:before { content: 'TeX'; }\12  pre.src-plain-tex:before { content: 'Plain TeX'; }\12  pre.src-verilog:before { content: 'Verilog'; }\12  pre.src-vhdl:before { content: 'VHDL'; }\12  pre.src-xml:before { content: 'XML'; }\12  pre.src-nxml:before { content: 'XML'; }\12  /* add a generic configuration mode; LaTeX export needs an additional\12     (add-to-list 'org-latex-listings-langs '(conf \" \")) in .emacs */\12  pre.src-conf:before { content: 'Configuration File'; }\12\12  table { margin-top: 0; margin-bottom: 0; border-collapse:collapse; }\12  caption.t-above { caption-side: top; }\12  caption.t-bottom { caption-side: bottom; }\12  td, th { vertical-align:top;  }\12  th.org-right  { text-align: center;  }\12  th.org-left   { text-align: center;   }\12  th.org-center { text-align: center; }\12  td.org-right  { text-align: right;  }\12  td.org-left   { text-align: left;   }\12  td.org-center { text-align: center; }\12  dt { font-weight: bold; }\12  .footpara { display: inline; }\12  .footdef  { margin-bottom: 0em; }\12  .figure { padding: 1em; }\12  .figure p { text-align: center; }\12  .equation-container {\12    display: table;\12    text-align: center;\12    width: 100%;\12  }\12  .equation {\12    vertical-align: middle;\12  }\12  .equation-label {\12    display: table-cell;\12    text-align: right;\12    vertical-align: middle;\12  }\12  .inlinetask {\12    padding: 10px;\12    border: 2px solid gray;\12    margin: 0px;\12    background: #ffffcc;\12  }\12  #org-div-home-and-up\12   { text-align: right; font-size: 70%; white-space: nowrap; }\12  textarea { overflow-x: auto; }\12  .linenr { font-size: smaller }\12  .code-highlighted { background-color: #ffff00; }\12  .org-info-js_info-navigation { border-style: none; }\12  #org-info-js_console-label\12    { font-size: 10px; font-weight: bold; white-space: nowrap; }\12  .org-info-js_search-highlight\12    { background-color: #ffff00; color: #000000; font-weight: bold; }\12  .org-svg { }\12</style>")
   '(org-html-table-default-attributes
     '(:border "1" :cellspacing "4" :cellpadding "4" :rules "groups" :frame "hsides"))
   '(package-selected-packages
     '(add-node-modules-path counsel-gtags counsel swiper ivy dap-mode lsp-docker
                             lsp-treemacs bui lsp-mode ggtags import-js grizzl
                             js-doc js2-refactor multiple-cursors livid-mode
                             nodejs-repl npm-mode skewer-mode js2-mode tern
                             define-word zenburn-theme zen-and-art-theme yapfify
                             yaml-mode ws-butler winum white-sand-theme which-key
                             web-mode volatile-highlights vi-tilde-fringe uuidgen
                             use-package underwater-theme ujelly-theme
                             twilight-theme twilight-bright-theme
                             twilight-anti-bright-theme toxi-theme toc-org
                             tao-theme tangotango-theme tango-plus-theme
                             tango-2-theme tagedit sunny-day-theme sublime-themes
                             subatomic256-theme subatomic-theme sql-indent
                             spaceline spacegray-theme soothe-theme
                             solarized-theme soft-stone-theme soft-morning-theme
                             soft-charcoal-theme smyx-theme smeargle slim-mode
                             seti-theme scss-mode sass-mode reverse-theme
                             reveal-in-osx-finder restart-emacs rebecca-theme
                             rainbow-delimiters railscasts-theme pyvenv pytest
                             pyenv-mode py-isort purple-haze-theme pug-mode
                             professional-theme popwin planet-theme
                             pip-requirements phoenix-dark-pink-theme
                             phoenix-dark-mono-theme persp-mode pcre2el pbcopy
                             paradox osx-trash osx-dictionary orgit
                             organic-green-theme org-projectile org-present
                             org-pomodoro org-mime org-download org-bullets
                             open-junk-file omtose-phellack-theme oldlace-theme
                             occidental-theme obsidian-theme noctilux-theme
                             neotree naquadah-theme mustang-theme move-text
                             monokai-theme monochrome-theme molokai-theme
                             moe-theme mmm-mode minimal-theme material-theme
                             markdown-toc majapahit-theme magit-gitflow
                             madhat2r-theme macrostep lush-theme lorem-ipsum
                             live-py-mode linum-relative link-hint
                             light-soap-theme launchctl jedi-direx jbeans-theme
                             jazz-theme ir-black-theme inkpot-theme indent-guide
                             hy-mode hungry-delete htmlize hl-todo
                             highlight-parentheses highlight-numbers
                             highlight-indentation heroku-theme hemisu-theme
                             helm-themes helm-swoop helm-pydoc helm-projectile
                             helm-mode-manager helm-make helm-gitignore helm-flx
                             helm-descbinds helm-css-scss helm-company
                             helm-c-yasnippet helm-ag hc-zenburn-theme
                             gruvbox-theme gruber-darker-theme grandshell-theme
                             gotham-theme google-translate golden-ratio gnuplot
                             gitconfig-mode gitattributes-mode git-timemachine
                             git-messenger git-link gh-md gandalf-theme fuzzy
                             flx-ido flatui-theme flatland-theme
                             fill-column-indicator farmhouse-theme fancy-battery
                             eyebrowse expand-region exotica-theme
                             exec-path-from-shell evil-visualstar
                             evil-visual-mark-mode evil-unimpaired evil-tutor
                             evil-surround evil-search-highlight-persist
                             evil-numbers evil-nerd-commenter evil-mc evil-matchit
                             evil-magit evil-lisp-state evil-indent-plus
                             evil-iedit-state evil-exchange evil-escape evil-ediff
                             evil-args evil-anzu eval-sexp-fu ess-smart-equals
                             ess-R-data-view espresso-theme emmet-mode
                             elisp-slime-nav dumb-jump dracula-theme django-theme
                             diminish darktooth-theme darkokai-theme
                             darkmine-theme darkburn-theme dakrone-theme
                             cython-mode cyberpunk-theme csv-mode company-web
                             company-statistics company-anaconda
                             column-enforce-mode color-theme-sanityinc-tomorrow
                             color-theme-sanityinc-solarized clues-theme
                             clean-aindent-mode cherry-blossom-theme busybee-theme
                             bubbleberry-theme birds-of-paradise-plus-theme
                             badwolf-theme auto-yasnippet auto-highlight-symbol
                             auto-compile apropospriate-theme anti-zenburn-theme
                             ample-zen-theme ample-theme alect-themes
                             aggressive-indent afternoon-theme adaptive-wrap
                             ace-window ace-link ace-jump-helm-line ac-ispell)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:background nil)))))
  )
