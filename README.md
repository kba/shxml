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
            backend    Run a backend directly
            xpath      Run xpath expression
            xslt       Transform XML with XSLT
            xsd        Validate XML against XSD
    
        Run 'shxml <command> --help to get command-specific help

<!-- END-EVAL -->
