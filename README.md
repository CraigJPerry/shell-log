shell-log
=========

A tiny cross platform & cross shell, log4j alike, logging library.

The benefits over simple `echo` statements in your script are:

-   Automatically provides **timestamps** and **severity levels** to your logfile
    entries.
-   Includes the source **hostname**, essential in multi host environments.
-   Automatically redirects **output to stderr** for easy filtering of your
    script's output and it's logging.
-   Contains **source script filename**, which is great if your script calls other
    scripts, a common occurance in a mature operations environment.
    across smaller scripts.
-   Unlike other shell logging libraries, this works across platforms such as
    **MacOS**, **Linux**, **Solaris** and **Cygwin**. It also works across bourne compatible
    shells: **sh**, **bash**, **ksh** (both pdksh & ksh93).

Usage
-----

From your shell script, simply include the shell-log.sh library:

    . shell-log.sh
    INFO "This is an info message"
    WARN "This is a warning message"

The output for these examples is:

    2012-06-30 16:09:57 [Craigs-Mac-Pro.local] INFO (test.sh) This is an info message
    2012-06-30 16:09:57 [Craigs-Mac-Pro.local] WARN (test.sh) This is a warning message

