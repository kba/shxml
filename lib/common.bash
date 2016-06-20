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

## Prepend `$SHXMLSHARE/libcommand to `$PATH`
##
export PATH="$(dirname "$0"):$SHXMLSHARE/lib/command:$PATH"
## Source libs
##
## * `shlog/shlog.sh`
# if [[ -z "$SHLOG_INITIALIZED" ]];then
    source "$SHXMLSHARE/lib/shlog/shlog.sh"
# fi
## * `args.bash`
source "$SHXMLSHARE/lib/args.bash"
## * `utils.bash`
source "$SHXMLSHARE/lib/utils.bash"
## * `backend.bash`
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
