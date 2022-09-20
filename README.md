# Kria KR260

[![Hex version](https://img.shields.io/hexpm/v/nerves_system_kr260.svg "Hex version")](https://hex.pm/packages/nerves_system_kr260)

This is the base Nerves System configuration for the Kria KR260.


| Feature         | Description                                                                  |
| --------------- | ---------------------------------------------------------------------------- |
| CPU             | 1.333 GHz quad-core Cortex-A53                                               |
| Memory          | 4 GB DDR4                                                                    |
| Storage         | MicroSD, 512 Mb QSPI, 16 GB eMMC, 64 Kb EEPROM                               |
| Linux kernel    | [linux-xlnx](https://github.com/Xilinx/linux-xlnx)                           |
| IEx terminal    | HDMI and USB keyboard (can be changed to UART)                               |
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

## Provisioning devices

This system supports storing provisioning information in a small key-value store
outside of any filesystem. Provisioning is an optional step and reasonable
defaults are provided if this is missing.

Provisioning information can be queried using the Nerves.Runtime KV store's
[`Nerves.Runtime.KV.get/1`](https://hexdocs.pm/nerves_runtime/Nerves.Runtime.KV.html#get/1) function.

Keys used by this system are:

Key                    | Example Value     | Description
:--------------------- | :---------------- | :----------
`nerves_serial_number` | `"12345678"`      | By default, this string is used to create unique hostnames and Erlang node names. If unset, it defaults to part of the Raspberry Pi's device ID.

The normal procedure would be to set these keys once in manufacturing or before
deployment and then leave them alone.

For example, to provision a serial number on a running device, run the following
and reboot:

```elixir
iex> cmd("fw_setenv nerves_serial_number 12345678")
```

This system supports setting the serial number offline. To do this, set the
`NERVES_SERIAL_NUMBER` environment variable when burning the firmware. If you're
programming MicroSD cards using `fwup`, the commandline is:

```sh
sudo NERVES_SERIAL_NUMBER=12345678 fwup path_to_firmware.fw
```

Serial numbers are stored on the MicroSD card so if the MicroSD card is
replaced, the serial number will need to be reprogrammed. The numbers are stored
in a U-boot environment block. This is a special region that is separate from
the application partition so reformatting the application partition will not
lose the serial number or any other data stored in this block.

Additional key value pairs can be provisioned by overriding the default
provisioning.conf file location by setting the environment variable
`NERVES_PROVISIONING=/path/to/provisioning.conf`. The default provisioning.conf
will set the `nerves_serial_number`, if you override the location to this file,
you will be responsible for setting this yourself.

