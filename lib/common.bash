#!/bin/bash

# BEGIN-INCLUDE LICENSE-header
# END-INCLUDE

## set -e
set -e

if [[ -z "$SHXMLSHARE" ]];then
    echo "!! \$SHXMLSHARE not set. Run as '$(echo "$0"|sed -e 's,.*/,,' -e 's,-, ,')' !!"
    exit 142
fi
export PATH="$SHXMLSHARE/lib/command:$PATH"
source "$SHXMLSHARE/lib/logging.bash"
source "$SHXMLSHARE/lib/args.bash"
