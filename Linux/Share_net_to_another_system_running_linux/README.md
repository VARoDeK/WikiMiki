
---

| [Home](/README.md) | [Index](../README.md) | [Back](../2_disable_config_pm_in_linux_config_file.md) | [Next](../../Newlib/README.md) |
| :---: | :---: | :---: | :---: |

---

# Share internet with another system which is also running linux via ethernet

Refer: https://wiki.archlinux.org/index.php/Internet_sharing

Your current system will be referred as 'Server', and the system which will get the shared internet access will be referred as 'Client'.

Client can be an IoT board, an evaluation board, or another fully fledged computer.

---

## 1) - How to?

### 1.1) - Download the below mentioned scripts:

1) Run [share_net_via_ethernet-server.sh](./share_net_via_ethernet-server.sh) on server.


```
./share_net_via_ethernet-server.sh <interface0> <interface1>
```

Where 'interface0' is the interface through which Host/server gets internet access. And 'interface1' is the interface through which internet is shared with target/client.


2) Run [share_net_via_ethernet-client.sh](./share_net_via_ethernet-client.sh) on client.

```
./share_net_via_ethernet-client.sh <interface2>
```

Where 'interface2' is the interface through which you will get the shared internet from the host.

__Then connect the systems via ethernet cable.__

### 1.2) - What arguments should be passed to the scripts on command line?

Just run the script without any argument(s), it will alert you and will print an example command.

---

## 2) - Will this work on your setup?

The Server should have an additional network device. 

If you are sharing to only one machine, a crossover cable is sufficient. In case one of the two computers' ethernet cards has MDI-X capability, a crossover cable is not necessary and a regular ethernet cable can be used. Executing

```
ethtool interface | grep MDI
```

as root helps to figure it.

---

## 3) - Do check the IP before moving ahead

An arbitary IP address `192.168.123.100/24` will be alloted to the ethernet interface on Server by the script. The value can be changed if one wants to, just edit the script for this part. _( __Note__ : The first 3 bytes of this address cannot be exactly the same as those of another interface, unless both interfaces have netmasks strictly greater than /24.)_

Similarly, an arbitary IP address `192.168.123.98/24` is given to the client. Again, this can also be changed.

---

## 4) - Script compatibility

To make the script run successfully on all linux systems, this script is written in compatibility with POSIX Sh _(instead of bash or zsh)_

---

## 5) - Auto run the scripts

You can add these scripts to `~/profile` on respective systems.

---
