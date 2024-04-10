# Dotfiles

Erik's [dotfiles](https://dotfiles.github.io)

# Setup

This will both install chezmoi and apply this repository in one line. 

For managing beyond first run, see https://www.chezmoi.io/

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply erikkerber
```

## About

These dotfiles are a reflection of my development style and personal 
workflows, with a particular flair for:

* The [Fish Shell](https://fishshell.com)
* Vim
* Xcode and iOS tooling

They are published for the benefit of anyone of learning, inspiring, or 
as a reference to anyone who may stumble upon them.

# Credit

These dotfiles were inspired by a collection of developers in the
community whos dotfiles I have used, referenced, or in some cases
outright copied.

Much of my knowledge of Vim, Git, LLDB, Fish, and system configuration
came from reverse engineering the works below.

* [holman/dotfiles](https://github.com/holman/dotfiles) - The first
    version of these dotfiles were heavily influenced by Zac's example.
* [keith/dotfiles](https://github.com/keith/dotfiles) - For Xcode
    tooling, and what helped me stumble upon my two favorite color
    schemes [parsec](https://github.com/keith/parsec) and
    [panic](panic.xccolortheme)
* [budimanjojo/dotfiles](https://github.com/budimanjojo/dotfiles) — A fantastic chezmoi + Fish setup
