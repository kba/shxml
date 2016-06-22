# API

<!-- BEGIN-MARKDOWN-TOC -->
* [args.bash](#argsbash)
* [backend.bash](#backendbash)
* [common.bash](#commonbash)
* [java.bash](#javabash)
* [utils.bash](#utilsbash)

<!-- END-MARKDOWN-TOC -->

## args.bash
<!-- BEGIN-RENDER lib/args.bash -->

* `<source-files>` - 1..n filenames. Pass a single `-` to read from `STDIN`

<!-- END-RENDER -->
## backend.bash
<!-- BEGIN-RENDER lib/backend.bash -->


<!-- END-RENDER -->
## common.bash
<!-- BEGIN-RENDER lib/common.bash -->
`IFS=$'
'`

Split input only on newlines, not tab, not space. Newline.

`set -e`

Break on all unhandled errors

* Prepend `$SHXMLSHARE/lib/command to `$PATH`
* Prepend `$SHXMLSHARE/deps/bin to `$PATH`

Source libs

* [`shlog`](https://github.com/kba/shlog)
* [`backend.bash`](./lib/config.bash)
* [`args.bash`](./lib/args.bash)
* [`utils.bash`](./lib/utils.bash)
* [`backend.bash`](./lib/backend.bash)
Load configurations

Search path:

  * /etc/default/shxml
  * $HOME/.config/shxml/config

<!-- END-RENDER -->
## java.bash
<!-- BEGIN-RENDER lib/java.bash -->


<!-- END-RENDER -->
## utils.bash
<!-- BEGIN-RENDER lib/utils.bash -->


<!-- END-RENDER -->
