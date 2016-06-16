#!/bin/bash

_backend_saxon() {
    clazz="net.sf.saxon.$1"
    java -jar "$SHXMLSHARE/saxon9he.jar" "$@"
}
