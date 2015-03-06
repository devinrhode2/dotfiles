(setq-default dotspacemacs-configuration-layers '(osx fasd git))

(setq-default dotspacemacs-configuration-layer-path
              '("~/desktop/repos/dotfiles/devin-packages"))

(defun dotspacemacs/init ()
  (setq-default git-enable-github-support t)
  (setq-default git-magit-status-fullscreen t)
)

(defvar dotspacemacs-default-package-repository 'melpa-stable
  "The default package repository used if no explicit repository has been
specified with an installed package."
)

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  ;; Stay on the original character when leaving insert mode
  ;; (initiated with 'i').
  (setq evil-move-cursor-back nil))
