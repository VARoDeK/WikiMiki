
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](/Bootable_Programs/README.md) |
| :---: | :---: | :---: | :---: |

---

# Setup Multiple Monitors

## Note: Below commands are based on my Laptop (HP 15-AB516TX). Similarly they can be used for others as well.

---

## My System Description:

* OS: Arch Linux
* WM: i3-gaps
* Graphics: Nvidia + intel
* Name of default monitor of Laptop: __`edp-1-1`__
* Name of default HDMI port of Laptop: __`HDMI-1-1`__

---

## 1) Basic Commands

* List monitors : `xrandr --listmonitors`
* List Active Monitors: `xrandr --listactivemonitors`
* Display details of all Display-Devices: `xrand -q`

---

## 2) Disable/ off the external monitor (HDMI-1-1 in my case)

```shell
xrandr --output HDMI-1-1 --off
```  

---

## 3) Connect external Monitor to the desired side and __select it as primary__.

By default, I will set it to left side:

* For left: `--left-of`
* For right: `--right-of`
* For top: `--top of`
* For bottom: `--bottom-of`


```shell
xrandr --output eDP-1-1 --auto --output HDMI-1-1 --primary --auto --left-of eDP-1-1
```

---

## 4) Connect external Monitor to the desired side and but __keep the deafult as primary__.

By default, I will set it to left side:

* For left: `--left-of`
* For right: `--right-of`
* For top: `--top of`
* For bottom: `--bottom-of`


```shell
xrandr --output eDP-1-1 --primary --auto --output HDMI-1-1 --auto --left-of eDP-1-1
```

---

## 5) Connect external Monitor and mirror it.

```shell
xrandr --output eDP-1-1 --auto --output HDMI-1-1 --auto --same-as eDP-1-1
```

---