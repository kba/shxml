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

## CREDITS

`shxml` is bundling various Open Source software that do the hard
work. Some software is directly bundled for convenience, other tools
are installed at build time or can be added at run time.

I'm trying to give credit where credit is due and to adhere to the
terms of the different licenses. I Am Not A Layer though, so please
get in touch if you feel something is amiss license-wise.

### Bundled Software

* [Saxon HE](http://saxon.sourceforge.net/), `MPL 1.0`
* [Xalan-J](https://xml.apache.org/xalan-j), `Apache 2.0`

### Build time install

* [drip](https://github.com/ninjudd/drip), `EPL`
* [shlog](https://github.com/kba/tsht), `MIT`
* [shinclude](https://github.com/kba/shinclude), `MIT`
