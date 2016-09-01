## Git Hooks

https://github.com/git/git/blob/master/Documentation/githooks.txt

## Requirements

* git 2.9 or newer.

## Installation

```bash
# Get the repository
git clone https://github.com/halo/githooks.git $HOME/.githooks

# Start using them by adding it to your ~/.gitconfig
# This can be commited to your dotfiles, because it is ignored if the directory does not exist.
git config --global core.hooksPath $HOME/.githooks
```
