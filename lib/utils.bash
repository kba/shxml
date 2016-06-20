_shxml_in_array () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

# _shxml_list_with_default() {
#     local def="$1" prefix
#     shift
#     for i in "$@";do
#         [[ "$i" = "$def" ]] && prefix="* " || prefix="  "
#         echo "$prefix$i"
#     done
# }

_shxml_mark_ok() {
    echo -ne "\e[32;1m✓ \e[0m"
}
_shxml_mark_notok() {
    echo -ne "\e[31;1m✗✓ \e[0m"
}
