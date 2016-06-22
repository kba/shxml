#!/bin/bash

# BEGIN-INCLUDE LICENSE-header
# END-INCLUDE

## `IFS=$'\n'`
##
## Split input only on newlines, not tab, not space. Newline.
##
# export IFS=$'\n'

## `set -e`
##
## Break on all unhandled errors
##
set -e

## * Prepend `$SHXMLSHARE/lib/command to `$PATH`
## * Prepend `$SHXMLSHARE/deps/bin to `$PATH`
##
export PATH
PATH="$SHXMLSHARE/bin:$PATH"
# PATH="$SHXMLSHARE/deps/bin:$PATH"
PATH="$SHXMLSHARE/lib/command:$PATH"
## Source libs
##
## * [`shlog`](https://github.com/kba/shlog)
# source "$(which shlog)"
source "$SHXMLSHARE/deps/bin/shlog"
## * [`backend.bash`](./lib/config.bash)
source "$SHXMLSHARE/lib/config.bash"
## * [`args.bash`](./lib/args.bash)
source "$SHXMLSHARE/lib/args.bash"
## * [`utils.bash`](./lib/utils.bash)
source "$SHXMLSHARE/lib/utils.bash"
## * [`backend.bash`](./lib/backend.bash)
source "$SHXMLSHARE/lib/backend.bash"

## Load configurations
##
## Search path:
##
##   * /etc/default/shxml
##   * $HOME/.config/shxml/config
##
for profile in "/etc/default/shxml" "$HOME/.shxmlrc";do
    if [[ -f "$profile" ]];then 
        source "$profile"
        shlog info "Sourced '$profile'"
    fi
    true
done
