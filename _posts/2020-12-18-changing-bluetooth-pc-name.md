---
title: "Changing PC Device Name for Bluetooth on Windows 10"
last_modified_at: 20201218T150000-0700
---

I am lucky enough to own a pair of [Bose QC35 II headphones](https://www.bose.com/en_us/products/headphones/over_ear_headphones/quietcomfort-35-wireless-ii.html),
which can connect to multiple devices using Bluetooth. The headphones
announce the name of each device they connect to. Sometimes, my Windows PC ends up
with the device name all in caps, and the headphones spell out the letters
rather than saying the name as a word.

It is possible to change the name your Windows PC uses for the Bluetooth device
without needing to change the way the PC name is reflected elsewhere. To do this,
use Device Manager and navigate to the Bluetooth radio adapter on your PC.

[![Screenshot of Windows Device Manager with Bluetooth Radio Adapter highlighted](/assets/uploads/2020/devicemanager-bluetooth-adapter.png)](/assets/uploads/2020/devicemanager-bluetooth-adapter.png)

In the Properties for the Bluetooth Radio Adapter, on the Advanced tab, you
can edit the name that the PC device appears as over Bluetooth. Here, I was able
to change the name from all caps to a single capitalized word so that the
headphones will capture the new name and report it out correctly.

[![Screenshot of Bluetooth Radio Adapter Advanced Properties Page](/assets/uploads/2020/bluetooth-adapter-advanced-properties.png)](/assets/uploads/2020/bluetooth-adapter-advanced-properties.png)
