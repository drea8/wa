
# ワ Wa

Wacom strokes through evdev over userland
Realtime graphics tablet controller device for Common Lisp.

* keyboardless environment concept
* accessibility driver for keyboard-impaired
* Lisp access over a Wacom or touch tablet

# Install
(LOAD "wa.lisp")
(WA::SET-DEVICE "/dev/input/by-id/usb-WACOM_CTE-440-U_V4.0-3-mouse")
(WA::WA)
(WA::COMPILE-WA-IMAGE) 

To calibrate a new device bytestream, connect the device, check for the new device in /dev/input/, and use the evdev tool evemu-record while using the physical device to review hardware event information and register the appropriate event functionality in wa.lisp.

* [working with evdev tools](https://www.freedesktop.org/wiki/Evemu/)
* [kernel doc on hardware input event codes](https://www.kernel.org/doc/Documentation/input/event-codes.txt)
* [kernel input source (input event structs)](https://github.com/torvalds/linux/blob/master/include/uapi/linux/input.h)

currently supported devices:
* build tested on Wacom CTE-440
* most touch or graphic tablets

thanks to [jtgans](https://github.com/jtgans/) for [cl-evdev](https://github.com/jtgans/cl-evdev), the [fork with wacom support added is here](https://github.com/olewhalehunter/cl-evdev)

# To Do

* graph letter entry, direction chains
* lisp repl entry bootstrap
* userspace binds