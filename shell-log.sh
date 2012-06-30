# vim: ts=2:sw=2:et:tw=79:
# TITLE
#   shell-log.sh
# DESCRIPTION
#   A tiny cross platform & cross shell, log4j alike, logging library.
# AUTHOR
#   Craig Perry <capped@github>
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
#   20120630 Craig Perry initial version created.
# LICENCE
#   Copyright (c) 2012, Craig Perry
#   All rights reserved.
#   
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions are met:
#       * Redistributions of source code must retain the above copyright
#         notice, this list of conditions and the following disclaimer.
#       * Redistributions in binary form must reproduce the above copyright
#         notice, this list of conditions and the following disclaimer in the
#         documentation and/or other materials provided with the distribution.
#       * Neither the name of the <organization> nor the
#         names of its contributors may be used to endorse or promote products
#         derived from this software without specific prior written permission.
#   
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#   DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
#   DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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

