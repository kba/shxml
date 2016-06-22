# shxml

<!-- BEGIN-BANNER -f "standard" -w "\`\`\`" "The last XML CLI you'll need\n\`\`\`" "shxml" -->
```
     _                    _ 
 ___| |__ __  ___ __ ___ | |
/ __| '_ \\ \/ / '_ ` _ \| |
\__ \ | | |>  <| | | | | | |
|___/_| |_/_/\_\_| |_| |_|_|
The last XML CLI you'll need
```

<!-- END-BANNER -->

<!-- BEGIN-MARKDOWN-TOC -->
* [USAGE](#usage)
* [CONFIGURATION](#configuration)
	* [SHXML_USE_DRIP](#shxml_use_drip)
	* [SHXML_INCREASE_ULIMIT](#shxml_increase_ulimit)
	* [SHXML_BACKEND_XSLT](#shxml_backend_xslt)
* [CREDITS](#credits)
	* [Bundled Software](#bundled-software)
	* [Build time install](#build-time-install)

<!-- END-MARKDOWN-TOC -->

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

## CONFIGURATION

<!-- BEGIN-RENDER lib/config.bash -->
### SHXML_USE_DRIP

Whether to use drip instead of the JVM directly

This can make subsequent JVM startups faster but can lead to hangs.

Default: `false`

### SHXML_INCREASE_ULIMIT

Whether to try to increase ulimit

Default: `false`

### SHXML_BACKEND_XSLT

Backend to use for XSLT. Overrides the default mechanism but not
a backend passed on the command line

Default: `(unset)`

<!-- END-RENDER -->

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
