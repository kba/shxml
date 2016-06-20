typeset -a SHXMLBACKENDS
export SHXMLBACKENDS=($(ls "$SHXMLSHARE/lib/backend"))

_shxml_backend() {
    local backend="$1"; shift
    source "$SHXMLSHARE/lib/backend/$backend" "$@"
}

_shxml_backend_check_installed() {
    local cmd backends
    for cmd in "$@";do
        backends+="       $(_shxml_backend "$cmd" --check-installed)\t${cmd} \t $(_shxml_backend "$cmd" --synopsis)\n"
    done
    echo -e "$backends"|column -ts'	'
}

_shxml_backend_determine() {
    BACKEND="$1"; shift;
    if [[ -n "$BACKEND" ]];then
        shlog -l debug "Use '$cmd' backend for '$cmd' (env var)"
        return
    fi
    for cmd in "$@";do
        if (_shxml_backend "$cmd" --check-installed >/dev/null);then
            shlog -l debug "Use '$cmd' backend (first in list installed)"
            BACKEND="$cmd"
            return
        fi
    done
    shlog -l error -x 2 "No usable backend installed"
}

