# captal
(Wireless) (RogueAP) (MITM) (Phishing) attack framework

### about

captal is a security auditing and social-engineering research project.

The main goal is to provide the modular constructor for MITM-Phishing attacks.
See [examples](https://github.com/chinarulezzz/captal/#examples) for usage.

### dependencies

- lighttpd
- isc-dhcp-server
- perl-net-dns (and perl itself)
- hostapd

---

### overview

#### configs

- /etc/captal/chkwpa.conf: captal-chkwpa tool configuration
- /etc/captal/dhcpd.conf: dhcp server configuration
- /etc/captal/hostapd.conf: rogue AP configuration
- /etc/captal/lighttpd.conf: phishing server configuration

#### rc (services)

- /etc/rc.d/captal: start/stop all captal services in correct order
- /etc/rc.d/captal-prepare: prepare rogue AP interface
- /etc/rc.d/captal-hostapd: start/stop rogue AP server
- /etc/rc.d/captal-dhcpd: start/stop dhcp server
- /etc/rc.d/captal-dnsserv: start/stop dns server
- /etc/rc.d/captal-lighttpd: start/stop phishing server

#### utils

- /usr/bin/captal-chkwpa: check phished wpa/wpa2 password against sniffed handshakes
- /usr/bin/captal-dnsserver: simple and extendable dns server
- /usr/bin/captal-gencert: generate self-signed certificate for phishing site

#### logs

- /var/log/messages: dhpcd, captal-dnsserv (info), hostapd, lighttpd
- /var/log/lighttpd.log: lighttpd
- /var/log/captal-dnsserv.log: captal-dnsserv (verbose)
- /var/log/mail: captal-chkwpa successful phished password

#### phishing portals

- /var/www/captal/sites ([screenshots](https://github.com/chinarulezzz/captal/blob/master/PORTALS.md))

---

### examples

- [Evil Twin MITM Phishing](https://github.com/chinarulezzz/captal/blob/master/doc/EvilTwin_MITM_Phishing.md)

---

### LEGAL DISCLAIMER

The author does not hold any responsibility for the bad use of this tool,
remember that attacking targets without prior consent is illegal and punished by law.
