---
title: "Running ESPHome on a ESP32C6 device for Home Assistant"
last_modified_at: 20241201T200000-0800
header:
  image: /assets/uploads/2024/esp32.jpg
  image_description: "Futuristic image of an ESP32 (AI generated)"
---

# ESP32C6 boards are not native supported by ESPHome

The [ESPHome](https://esphome.io/) project provides a way to use ESP32-based microcontrollers
with [Home Assistant]https://www.home-assistant.io/). Recently I have been experimenting with
the [Seeed Studio Xiao ESP32C6](https://wiki.seeedstudio.com/xiao_esp32c6_getting_started/)
microcontrollers, which come are packaged as a tiny PCB with a USB-C connector to power or
program them. These devices include WiFi and Bluetooth support.

I came across the ESPHome project but unfortunately discovered that ESP32C6 boards are not
supported natively. Neverthless, I found that some people had managed to get them to work,
although there wasn't one place with all the instructions.

# Building firmware for ESP32C6 using Docker

I have Docker installed and ESPHome supports running its setup software using a Docker
container. First, you need to create a skeleton configuration file.

```bash
docker run --rm -it -v /home/user:/config ghcr.io/esphome/esphome wizard esp32c6.yaml
```

This command will create `esp32c6.yaml` in the `/user/home` folder. You answer the questions
for things like the name of the device and the WiFi network it will connect to.

Next, edit the file to support compiling for ESP32C6 and also add whatever support you
want from your controller according to the ESPHome documentation. I wanted to use my device
as a Bluetooth repeater. Here is the edited configuration file:

## esp32c6.yaml

```yaml
esphome:
  name: esp32c6
  platformio_options:
    platform: https://github.com/mnowak32/platform-espressif32.git#boards/seeed_xiao_esp32c6

esp32:
  board: seeed_xiao_esp32c6
  flash_size: 4MB
  variant: esp32c6
  framework:
    type: esp-idf
    version: 5.2.1
    sdkconfig_options:
      CONFIG_ESPTOOLPY_FLASHSIZE_4MB: y

# Enable logging
logger:

# Enable Home Assistant API
api:
  password: ""

ota:
  - platform: esphome
    password: ""

wifi:
  ssid: "SSID"
  password: "wifi-password"

  # Enable fallback hotspot (captive portal) in case wifi connection fails
  ap:
    ssid: "Esp32C6 Fallback Hotspot"
    password: "012345678999"

captive_portal:

bluetooth_proxy:
  active: true
```

Note 1: change `SSID` and `wifi-password` for your network. I also chose to start without passwords.

Note 2: I used v5.2.1 of ESP-IDF just because that was used in a few sample files I found from
people who got this to work. I will experiment with the more recent versions v5.2.3 and v5.3.1,
which are currently the latest versions.

## Build the firmware

Next, you need to build the firmware for the device using the following command:

```bash
docker run --rm -v /home/user:/config -it ghcr.io/esphome/esphome compile esp32c6.yaml
```

This will take a little while to download all the build tools in the Docker container and then
compile the code. Eventually, it will complete having built the firmware binary.

You can find the firmware located in `/home/user/.esphome/build/esp32wart/.pioenvs/esp32wart/firmware.factory.bin`.

# Flashing the firmware

I used `esptool.py` to flash the firmware onto the device, which I already had installed from
previously installing the [ESP-IDF tools](https://docs.espressif.com/projects/esp-idf). I think if
you have a recent version of Python installed, you can just install this with `pip install esptool`
but I haven't tried this.

To flash the firmware, I used the following command:

```bash
esptool.py -p COM6 --before default_reset --after hard_reset --chip esp32c6 write_flash --flash_mode dio --flash_size detect --flash_freq 40m 0x0 firmware.factory.bin
```

This is on Windows (hence the COM6), but I imagine it works with other platforms by changing the
port as appropriate. Most of the options are probably not necessary, but I created this command
based on the ESP-IDF documentation.

I think the important parts are the port, `--chip esp32c6`, and using 0x0 as the start address.

This should write the firmware and restart the device, where it will attempt to connect to
the network.

# Accessing microcontroller from Home Assistant

If you have installed the ESPHome integration in Home Assistant, then the microcontroller
should soon be detected as a new device by Home Assistant. If you add the device, then you can
start to use it with Home Assistant. I had configure my device as a Bluetooth Repeater, and
shortly after adding it to Home Assistant, all the Bluetooth devices it could see were also
made available in Home Assistant.
