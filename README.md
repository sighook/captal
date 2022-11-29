# captal

(Wireless) (RogueAP) (MITM) (Phishing) attack framework

### about

captal is a security auditing and social-engineering research project.

The main goal is to provide the modular constructor for MITM-Phishing
attacks.
See [examples](https://github.com/sighook/captal/#examples) for usage.

### dependencies

- lighttpd
- isc-dhcp-server
- perl-net-dns (and perl itself)
- hostapd
- php-cgi

---

### overview

#### configs

- `@ETCDIR@/captal/chkwpa.conf`: captal-chkwpa tool configuration
- `@ETCDIR@/captal/dhcpd.conf`: dhcp server configuration
- `@ETCDIR@/captal/hostapd.conf`: rogue AP configuration
- `@ETCDIR@/captal/lighttpd.conf`: phishing server configuration

#### rc (services)

- `@RCDIR@/captal`: start/stop all captal services in correct order
- `@RCDIR@/captal-prepare`: prepare rogue AP interface
- `@RCDIR@/captal-hostapd`: start/stop rogue AP server
- `@RCDIR@/captal-dhcpd`: start/stop dhcp server
- `@RCDIR@/captal-dnsserv`: start/stop dns server
- `@RCDIR@/captal-lighttpd`: start/stop phishing server

#### utils

- `@BINDIR@/captal-chkwpa`: check phished wpa/wpa2 password against
sniffed handshakes
- `@BINDIR@/captal-dnsserver`: simple and extendable dns server
- `@BINDIR@/captal-gencert`: generate self-signed certificate for
phishing site

#### logs

- `/var/log/messages`: dhpcd, captal-dnsserv (info), hostapd, lighttpd
- `/var/log/lighttpd.log`: lighttpd
- `/var/log/captal-dnsserv.log`: captal-dnsserv (verbose)
- `/var/log/mail`: captal-chkwpa successful phished password

#### phishing portals

- `@WWWDIR@/captal/sites`([screenshots](https://github.com/sighook/captal/blob/master/doc/PortalsPreview.md))

---

### examples

- [Evil Twin MITM Phishing](https://github.com/sighook/captal/blob/master/doc/EvilTwin_MITM_Phishing.md)

---

### HUGE THANKS

- [Fluxion Project](https://github.com/FluxionNetwork/fluxion)

- [AdvPhising Project](https://github.com/Ignitetch/AdvPhishing)

---

### LEGAL DISCLAIMER

The author does not hold any responsibility for the bad use of this
tool, remember that attacking targets without prior consent is illegal
and punished by law.

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
