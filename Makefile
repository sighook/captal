# This file is part of captal.
# See LICENSE file for copyright and license details.

# captal version
VERSION = 0.1

# paths
PREFIX = /usr/local
BINDIR = ${PREFIX}/bin
ETCDIR = /etc
RCDIR  = /etc/rc.d
WWWDIR = /var/www

######################################################################

HELPERS = $(subst .in,,$(wildcard helpers/*.in))
CONFIGS = $(subst .in,,$(wildcard configs/*.in))
RCS     = $(subst .in,,$(wildcard rc/*.in))

all: ${HELPERS} ${CONFIGS} ${RCS}

%: %.in
	sed -e "s|@BINDIR@|${BINDIR}|g" \
	    -e "s|@ETCDIR@|${ETCDIR}|g" \
	    -e "s|@RCDIR@|${RCDIR}|g"   \
	    -e "s|@WWWDIR@|${WWWDIR}|g" \
	    $<  >  $@

install: all
	install -m 0755 -Dt ${DESTDIR}${BINDIR}/        ${HELPERS}
	install -m 0644 -Dt ${DESTDIR}${ETCDIR}/captal  ${CONFIGS}
	install -m 0755 -Dt ${DESTDIR}${RCDIR}/         ${RCS}
	# sites
	install -d ${DESTDIR}${WWWDIR}/captal/sites
	cp -a sites/* ${DESTDIR}${WWWDIR}/captal/sites/

uninstall:
	# helpers
	rm -f  ${DESTDIR}${BINDIR}/captal-*
	# configs
	rm -rf ${DESTDIR}${ETCDIR}/captal/
	# rc
	rm -f  ${DESTDIR}${RCDIR}/captal*
	# sites
	rm -rf ${DESTDIR}${WWWDIR}/captal/

clean:
	rm -f ${HELPERS} ${CONFIGS} ${RCS}

.PHONY: all install uninstall clean

# vim:cc=72:tw=70
# End of file.
