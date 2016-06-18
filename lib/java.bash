#!/bin/bash

# BEGIN-INCLUDE LICENSE-header
# END-INCLUDE

export JAVACMD

cygwin=false
darwin=false
case "`uname`" in
    CYGWIN* ) cygwin=true ;;
    Darwin* ) darwin=true ;;
esac

# Determine the Java command to use to start the JVM.
set_java() {
    # For Cygwin, ensure paths are in UNIX format before anything is touched.
    if $cygwin ; then
        [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
    fi
    if [ -n "$JAVA_HOME" ] ; then
        if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
            # IBM's JDK on AIX uses strange locations for the executables
            JAVACMD="$JAVA_HOME/jre/sh/java"
        else
            JAVACMD="$JAVA_HOME/bin/java"
        fi
        if [ ! -x "$JAVACMD" ] ; then
            _error "JAVA_HOME is set to an invalid directory: $JAVA_HOME

    Please set the JAVA_HOME variable in your environment to match the
    location of your Java installation."
        fi
    else
        JAVACMD="java"
        which java >/dev/null 2>&1 || _error "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

    Please set the JAVA_HOME variable in your environment to match the
    location of your Java installation."
    fi
}

# Increase the maximum file descriptors if we can.
set_ulimit() {
    # Use the maximum available, or set MAX_FD != -1 to use that value.
    MAX_FD="maximum"
    if [ "$cygwin" = "false" -a "$darwin" = "false" ] ; then
        MAX_FD_LIMIT=`ulimit -H -n`
        if [ $? -eq 0 ] ; then
            if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
                MAX_FD="$MAX_FD_LIMIT"
            fi
            ulimit -n "$MAX_FD"
            if [ $? -ne 0 ] ; then
                _debug 0 "Could not set maximum file descriptor limit: $MAX_FD"
            fi
        else
            _debug 0 "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
        fi
    fi
}

set_java
set_ulimit
