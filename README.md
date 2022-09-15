# Kria KR260

[![Hex version](https://img.shields.io/hexpm/v/nerves_system_kr260.svg "Hex version")](https://hex.pm/packages/nerves_system_kr260)

This is the base Nerves System configuration for the Kria KR260.


| Feature         | Description                                                                  |
| --------------- | ---------------------------------------------------------------------------- |
| CPU             | 1.333 GHz quad-core Cortex-A53                                               |
| Memory          | 4 GB DDR4                                                                    |
| Storage         | MicroSD, 512 Mb QSPI, 16 GB eMMC, 64 Kb EEPROM                               |
| Linux kernel    | [linux-xlnx](https://github.com/Xilinx/linux-xlnx)                           |
| IEx terminal    | UART                                                                         |
| GPIO, I2C, SPI  | Raspberry Pi HAT I/F - [Elixir Circuits](https://github.com/elixir-circuits) |
| ADC             | No                                                                           |
| PWM             | No                                                                           |
| UART            | 1 available - `ttyPS1`                                                       |
| Display         | Display Port 1.2a                                                            |
| Camera          | No                                                                           |
| Ethernet        | 2 avaiable PS ethernet and 2 PL                                              |
| WiFi            | No                                                                           |
| Bluetooth       | No                                                                           |
| Audio           | No                                                                           |
| Pmod            | 4 available - 12-pin, Untested                                               |
| USB             | 4 available                                                                  |

## Using

The most common way of using this Nerves System is create a project with `mix
nerves.new` and to export `MIX_TARGET=kr260`. See the [Getting started guide](https://hexdocs.pm/nerves/getting-started.html#creating-a-new-nerves-app)
for more information.

If you need custom modifications to this system for your device, clone this
repository and update as described in [Making custom systems](https://hexdocs.pm/nerves/customizing-systems.html).

