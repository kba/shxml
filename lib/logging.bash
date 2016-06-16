## ## Logging
##
## ### `$LOGLEVEL`
##
## Default: 0
##
## See [`-d`](#-d) and [`-dd`](#-dd)
##
LOGLEVEL=${LOGLEVEL:-0}
typeset -a LOGLEVEL_COLORS=('3;1' '5;1' '4;1' '2;1' '5;1')

_log() {
    level="$1"
    shift
    if ((LOGLEVEL >= level));then
        echo -e "# \e[3${LOGLEVEL_COLORS[$level]}mDEBUG\e[39;0m $*" >&2
    fi
}

_error() {
    echo -e "\e[31;1mERROR\e[39;0m $*" >&2
    exit 2
}

_print_list_with_default() {
    local def="$1"
    shift
    for i in "$@";do
        if [[ "$i" = "$def" ]];then
            printf "* "
        else
            printf "  "
        fi
        echo "$i"
    done
}
