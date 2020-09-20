# captal - Captive Portal
# See LICENSE file for copyright and license details.

all:

install:
	# binaries
	install -d $(DESTDIR)/usr/bin
	install -m755 bin/captal-chkwpa  -t $(DESTDIR)/usr/bin
	install -m755 bin/captal-dnsserv -t $(DESTDIR)/usr/bin
	install -m755 bin/captal-gencert -t $(DESTDIR)/usr/bin
	# configs
	install -d $(DESTDIR)/etc/captal
	install -m644 cfg/chkwpa.conf    -t $(DESTDIR)/etc/captal
	install -m644 cfg/dhcpd.conf     -t $(DESTDIR)/etc/captal
	install -m644 cfg/dhcpd.leases   -t $(DESTDIR)/etc/captal
	install -m644 cfg/hostapd.conf   -t $(DESTDIR)/etc/captal
	install -m644 cfg/lighttpd.conf  -t $(DESTDIR)/etc/captal
	# rc
	install -d $(DESTDIR)/etc/rc.d
	install -m755 rc/captal          -t $(DESTDIR)/etc/rc.d
	install -m755 rc/captal-airbase  -t $(DESTDIR)/etc/rc.d
	install -m755 rc/captal-dhcpd    -t $(DESTDIR)/etc/rc.d
	install -m755 rc/captal-dnsserv  -t $(DESTDIR)/etc/rc.d
	install -m755 rc/captal-hostapd  -t $(DESTDIR)/etc/rc.d
	install -m755 rc/captal-lighttpd -t $(DESTDIR)/etc/rc.d
	install -m755 rc/captal-prepare  -t $(DESTDIR)/etc/rc.d
	# sites
	install -d $(DESTDIR)/var/www/captal/sites
	cp -a sites/* $(DESTDIR)/var/www/captal/sites

uninstall:
	# binaries
	rm -f  $(DESTDIR)/usr/bin/captal-chkwpa
	rm -f  $(DESTDIR)/usr/bin/captal-dnsserv
	rm -r  $(DESTDIR)/usr/bin/captal-gencert
	# configs
	rm -rf $(DESTDIR)/etc/captal
	# rc
	rm -f  $(DESTDIR)/etc/rc.d/captal
	rm -f  $(DESTDIR)/etc/rc.d/captal-airbase
	rm -f  $(DESTDIR)/etc/rc.d/captal-dhcpd
	rm -f  $(DESTDIR)/etc/rc.d/captal-dnsserv
	rm -f  $(DESTDIR)/etc/rc.d/captal-hostapd
	rm -f  $(DESTDIR)/etc/rc.d/captal-lighttpd
	rm -f  $(DESTDIR)/etc/rc.d/captal-prepare
	# sites
	rm -rf $(DESTDIR)/var/www/captal
	
.PHONY: all install uninstall
