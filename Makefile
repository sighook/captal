# This file is part of captal.
# See LICENSE file for copyright and license details.

# paths
PREFIX = /usr/local
BINDIR = ${PREFIX}/bin
ETCDIR = /etc
RCDIR  = /etc/rc.d
WWWDIR = /var/www

all:

BINS = $(shell ls -1 bin/*)
CFGS = $(shell ls -1 cfg/*)
RCS  = $(shell ls -1 rc/* )

install:
	# binaries
	install -m 0755 -Dt ${DESTDIR}${BINDIR}/ ${BINS}
	# configs
	install -m 0644 -Dt ${DESTDIR}${ETCDIR}/captal ${CFGS}
	# rc files
	install -m 0755 -Dt ${DESTDIR}${RCDIR}/ ${RCS}
	# sites
	install -d ${DESTDIR}${WWWDIR}/captal/sites
	cp -a sites/* ${DESTDIR}${WWWDIR}/captal/sites/

uninstall:
	# binaries
	rm -f  ${DESTDIR}${BINDIR}/captal-*
	# configs
	rm -rf ${DESTDIR}${ETCDIR}/captal/
	# rc
	rm -f  ${DESTDIR}${RCDIR}/captal*
	# sites
	rm -rf ${DESTDIR}${WWWDIR}/captal/
	
.PHONY: all install uninstall

# vim:cc=72:tw=70
# End of file.
