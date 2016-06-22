## ### SHXML_USE_DRIP
##
## Whether to use drip instead of the JVM directly
##
## This can make subsequent JVM startups faster but can lead to hangs.
##
## Default: `false`
##
export SHXML_USE_DRIP
SHXML_USE_DRIP=${SHXML_USE_DRIP:-false}

## ### SHXML_INCREASE_ULIMIT
##
## Whether to try to increase ulimit
##
## Default: `false`
##
export SHXML_INCREASE_ULIMIT
SHXML_INCREASE_ULIMIT=${SHXML_INCREASE_ULIMIT:-true}

## ### SHXML_BACKEND_XSLT
##
## Backend to use for XSLT. Overrides the default mechanism but not
## a backend passed on the command line
##
## Default: `(unset)`
##
export SHXML_BACKEND_XSLT
SHXML_BACKEND_XSLT=${SHXML_BACKEND_XSLT:-}
