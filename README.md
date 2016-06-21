# shxml

<!-- BEGIN-BANNER -f "standard" -w "<pre>" "The last XML CLI you'll need</pre>" "shxml" -->
<pre>
     _                    _
 ___| |__ __  ___ __ ___ | |
/ __| '_ \\ \/ / '_ ` _ \| |
\__ \ | | |>  <| | | | | | |
|___/_| |_/_/\_\_| |_| |_|_|
The last XML CLI you'll need</pre>

<!-- END-BANNER -->

## USAGE

<!-- BEGIN-EVAL ./bin/shxml --help |sed 's,^,    ,' -->
    shxml [global-opts] <command> [opts] <args>

        Global Options:
            -h, --help	Show help
            --trace		Enable tracing

        Commands:
            xpath      Run xpath expression
            backend    Run a backend directly
            xsd        Validate XML against XSD
            xslt       Transform XML with XSLT

        Run 'shxml <command> --help to get command-specific help

<!-- END-EVAL -->
