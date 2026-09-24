# los

A tiny launcher for everything you installed in the terminal.

You install a CLI tool, use it twice and forget its name. `los` remembers for you: it lists every program you installed with Homebrew, plus your own scripts, with a one-line description and a category. Type a few letters, pick one, done.

There is no catalog to maintain. Install something and it shows up.

## What does "los" mean?

*Los* is German for **go!** It is the last word of every German countdown, *"Auf die Plätze, fertig, los!"* (on your marks, get set, go!). Germans also say *"Was ist los?"* when they want to know what's going on.

So `los` is what you type when you want to get going but can't remember the name of the thing you want to start.

## How it works

`los` builds a small index and shows it in [fzf](https://github.com/junegunn/fzf):

- **Homebrew formulae** you installed on request, with their `brew desc` description. Libraries without a command of their own are skipped.
- **Homebrew casks** (apps), which open with `open -a`.
- **Your own scripts** in `~/.local/bin` or any folder you add. The description is the first comment line at the top of the script.

Every entry gets a category (Code, Media, Web, Files, System, Shell, AI, ...) derived from its description, so typing `media` shows your media tools. The preview on the right shows the [tldr](https://tldr.sh) page or the man page. Nothing is executed for the preview.

The picked command lands in your prompt. Press Enter to run it, or add arguments first.

The index is rebuilt automatically whenever Homebrew or one of your folders changes. Building it takes about a second.

## Install

Requirements: macOS or Linux with [Homebrew](https://brew.sh), `fzf` and `jq`. `tldr` is optional but makes the preview much nicer.

```sh
brew install fzf jq tlrc
curl -fsSL https://raw.githubusercontent.com/Wiredframe/los/main/los -o ~/.local/bin/los
chmod +x ~/.local/bin/los
```

Then add the shell integration, so the picked command lands in your prompt:

```sh
# ~/.zshrc
eval "$(los --init zsh)"

# ~/.bashrc
eval "$(los --init bash)"
```

## Usage

```sh
los              # pick a program
los --refresh    # rebuild the index now
los --help
```

In the list, just type: the filter matches name, category and description.

## Settings

All optional, set them before the `eval` line in your shell config.

| Variable | Default | Purpose |
|---|---|---|
| `LOS_PATHS` | `~/.local/bin` | Folders with your own scripts, separated by `:` |
| `LOS_IGNORE` | `~/.config/los/ignore` | Names to hide, one per line |
| `LOS_DESCRIPTIONS` | `~/.config/los/descriptions` | Descriptions for programs that have none, as `name: text` lines |

Example:

```sh
export LOS_PATHS="$HOME/.local/bin:$HOME/Scripts"
```

```text
# ~/.config/los/descriptions
claude: Claude Code, your assistant in the terminal
```

## Give your scripts a description

`los` reads the first comment line at the top of a script:

```sh
#!/bin/bash
# Backs up my dotfiles to the NAS.
```

That line is what you will see in the list.

## License

MIT
