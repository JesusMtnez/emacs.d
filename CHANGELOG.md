# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- First modular configuration
- [#3] Start versioning
- [#4] Add CHANGELOG (Yay!)
- New cores:
  - `core/core`: Define basic variables.
  - `core/core-packages`: Enable `ensure` and `defer` by default when using `use-package`.
  - `core/core-projects`: Basic support for project management
    - New package: `projectile`
  - `core/core-ui`: Visual interface settings
    - New packages: `doom-theme`, `dashboard`
- New modules:
  - `modules/module-ansible`: Add basic support for Ansible projects (`ansible`)
  - `modules/module-docker`: Add support for Dockerfiles (`dockerfile-mode`).
  - `modules/module-json`: Add JSON support (`json-mode`).
  - `modules/module-sh`: Support for scripting (bash, sh, zsh, ...)
    - New packages: `insert-shebang`, `company-shell`

### Changed

- Core:
  - `core/core`: Contains core emacs settings from `init.el`.
  - `core/core-helm`: Add `helm` setup.
  - `core/core-packages`: Add packages management support (`use-package`).
  - `core/core-ui`: Contains `highligth-chars`, `rainbow-mode`, `rainbow-delimiters`, `linum`, `zoom-window` and font settings.
- Modules:
  - `modules/module-company`: `company` basic setup.
  - `modules/module-git`: git basic setup (`git-gutter`, `git-gutter-fringe+`, `magit`)
  - `modules/module-markdown`: Markdown support (`markdown-mode`).
  - `modules/module-scala`: Scala support (`scala-mode`, `ensime`).
  - `modules/module-snippets`: Snippets support (`yasnippet`).
  - `modules/module-text`: text-related features (`move-text`).
  - `modules/module-undo`: Undo enhancements (`undo-tree`).
  - `modules/module-web`: Web Development support (`web-mode`, `emmet-mode`).
  - `modules/module-yaml`: YAML support (`yaml-mode`).
### Removed

- Saying goodbye to _Solarized_ theme

