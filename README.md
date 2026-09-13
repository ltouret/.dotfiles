# Dotfiles

Managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```fish
cd ~/.dotfiles
stow --dotfiles */
```

## Machine-Specific Fish Config

Add local environment variables or host-specific overrides to:
`~/.dotfiles/fish/dot-config/fish/conf.d/local.fish`
