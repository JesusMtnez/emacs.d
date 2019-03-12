[comment]: # (Start Badges)

[![GNU Emacs](https://img.shields.io/badge/GNU%20Emacs-25.3%20%2F%2026.1-blue.svg)](https://www.gnu.org/software/emacs/) [![GitHub](https://img.shields.io/github/license/JesusMtnez/emacs.d.svg)](/LICENSE) [![Gitlab pipeline status (branch)](https://img.shields.io/gitlab/pipeline/JesusMtnez/emacs.d/master.svg)](https://gitlab.com/JesusMtnez/emacs.d/pipelines)

[comment]: # (End Badges)

# [![Emacs](http://i.imgur.com/TANBZR2.png)]() JesusMtnez's Emacs Configuration [![Emacs](http://i.imgur.com/TANBZR2.png)]()

This repository contains my personal configuration for Emacs:

[![Emacs Preview](/assets/2019-01-25.png)](/assets/2019-01-25.png)

## Installation ##

To use this configuration, just clone the repository:

### SSH ###

```shell
git clone git@gitlab.com:JesusMtnez/emacs.d $HOME/.emacs.d
```

### HTTPS ###

```shell
git clone https://gitlab.com/JesusMtnez/emacs.d $HOME/.emacs.d
```

## Organization

The configuration is organized like:

```
.emacs.d
├── init.el
├── core/
│   └── ...
├── modules
│   └── ...
├── snippets/
│   └── ...
├── local/
│   └── cache/
├── CHANGELOG.md
├── LICENSE
├── README.md
└── custom.el
```

- `init.el`: bootstrap emacs configuration.
- `core`: main emacs functionality enhancements.
- `modules`: emacs extensions for my daily use.
- `local`: specific files for each  emacs installation.

## Copyright

Copyright (c) 2017-2019 JesusMtnez. See [LICENSE](/LICENSE) for details.
