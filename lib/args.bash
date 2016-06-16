# Tools for argument parsing

# ## _args_input_files_or_stdin
#
# * Parses the passed arguments as filenames or '-'
#   * if args is a single dash `-` => `(/dev/stdin)`
# * Makes sure they exist
# * Puts them in array '_ARGS_INPUT_FILES'
#
export _ARGS_INPUT_FILES
declare -a _ARGS_INPUT_FILES
_args_input_files_or_stdin() {
    ##
    ## * `<source-files>` - 1..n filenames. Pass a single `-` to read from `STDIN`
    ##
    if [[ "$1" == "-" ]];then
        _ARGS_INPUT_FILES+=(/dev/stdin)
        shift
        if [[ ! -z "$1" ]];then
            _error "Don't mix input files and STDIN."
        fi
    fi
    while [[ ! -z "$1" ]];do
        if [[ ! -e "$1" ]];then
            _error "No such file: '$1'"
        fi
        _ARGS_INPUT_FILES+=("$1")
        shift
    done
}
