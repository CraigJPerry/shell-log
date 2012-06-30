# vim: ts=2:sw=2:et:tw=79:
# TITLE
#   shell-log.sh
# DESCRIPTION
#   A tiny cross platform & cross shell, log4j alike, logging library.
# AUTHOR
#   Craig J Perry <craigp84@gmail.com>
# DEPENDENCIES
#  Operating System: Works on MacOS, Linux, Solaris & Cygwin
#  Shell: bash preferred. Also works with at least sh, ksh93 & pdksh
#  date command in $PATH
# HOWTO
#  . /path/to/shell-log.sh
#  INFO "Try to quote your parameters where possible. $VARS are allowed"
#  WARN No more than 9 parameters to maintain cross platform
# KNOWN BUGS
#
# CHANGELOG
#   20120630 Craig J Perry initial version created.
#

_datecmd=$( which date )
[[ ! -e $_datecmd ]] && _datecmd="/bin/date"

_tstamp () { _ts=$($_datecmd +'%F %T'); echo "$_ts [$( hostname )]"; }
_format () { _ts=$(_tstamp);_bn=$(basename $0); echo "$_ts $_sev ($_bn) $*"; }

FATAL () { _sev="FATAL"; _format $* >&2; };
CRITICAL () { _sev="CRITICAL"; _format $* >&2; }
ERROR () { _sev="ERROR"; _format $* >&2; }
WARN () { _sev="WARN"; _format $* >&2; }
INFO () { _sev="INFO"; _format $* >&2; }
DEBUG () { _sev="DEBUG"; _format $* >&2; }

