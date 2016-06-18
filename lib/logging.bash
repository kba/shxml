## ## Logging
##

## ### `$LOGLEVEL`
##
## Default: 0
##
export LOGLEVEL=${LOGLEVEL:-0}

## ### `$LOGLEVEL_COLORS`
##
## Default: yellow, green, blue, magenta
##
typeset -a LOGLEVEL_COLORS
export LOGLEVEL_COLORS=('3;1' '2;1' '4;1' '5;1')

_shxml_color() {
    echo -ne "\e[3${1}m"
}

_shxml_colored() {
    _shxml_color "$1"; shift
    echo -n "$*"
    _shxml_color_reset
}

_shxml_color_reset() {
    echo -ne "\e[39;0m"
}

_shxml_log() {
    level="$1"
    shift
    if ((LOGLEVEL >= level));then
        echo -ne "# " >&2
        _shxml_colored "${LOGLEVEL_COLORS[$level]}" "DEBUG: "
        echo -e "$*" >&2
    fi
}

_shxml_error() {
    echo -e "\e[31;1mERROR\e[39;0m $*" >&2
    exit 2
}

_shxml_list_with_default() {
    local def="$1" prefix
    shift
    for i in "$@";do
        [[ "$i" = "$def" ]] && prefix="* " || prefix="  "
        echo "$prefix$i"
    done
}

_shxml_mark_ok() {
    _shxml_colored "2;1" "✓ "
}
_shxml_mark_notok() {
    _shxml_colored "1;1" "✗ "
}
