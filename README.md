# fish-functions

Collection of useful functions and aliases for fish shell

## Installation

Download or clone the repository, then just run the `install.bash` script.
Enter 'y' and confirm your input to replace all the functions in your fish
config directory.

## Useful aliases

### `ls` and derivatives

The `ls` function will, instead of the usual `ls` binary, try to use `eza` or `exa`,
if either of them is installed on the system.

Other shorthands for common `ls` usages:
- `l`: short for `ls`
- `la`: short for `ls -a`
- `ll`: short for `ls -l`
- `lla`: short for `ls -l -a`

### Docker functions

Functions that aim to assist with using Docker:
- `dps`: prints Docker container status, but without network info
- `dpsq`: prints Docker container IDs
- `dpp`: prints Docker container network info (networks and ports)
- `dbash`: executes bash interactively in a running container
- `dsh`: executes sh interactively in a running container
- `dbinds`: prints bind-mounts and volumes of containers
- `dip`: prints container IP addresses

### Git functions

Providing shorthand forms of common git usages:
- `gs`: `git status`
- `gf`: `git fetch`
- `gp`: `git pull`
- `gch`: `git checkout`
- `gl`: `git log --pretty=oneline -n 20`
- `gadd`: `git add`
- `gap`: `git add --patch`
- `gd`: `git diff`
- `gds`: `git diff --staged`

### Other useful functions

- `venv`: Python virtual environment utility (activation, deactivation, creation)
- `psgrep`: find a running process by name using a pattern
- `clip`: copy stdin to the clipboard, using `xclip`
- `heil`: `head` and `tail` at the same time
- `cat`: will use `bat`, if available
- `tree`: will use `eza --tree`, if available

and many others!
