# aRduinoScope
A poor-man's oscilloscope using an Arduino and Ruby

This project works as a **very** low resolution oscilloscope.

![Screen Shot](/doc/screen_shot.png?raw=true "Oscilloscope Screenshot")

### Pros
* Cheap! $20 for an extra Arduino and you're up and running.
* Easily test output from analog sensors.
* Monitor all analog ports.

### Cons
* Low resolution.
* Low voltage - Do not supply more then 5 volts to the arduino.


## Using aRduinoScope

### The Arduino
1. Use the Arduino IDE to install the StandardFirmata example onto the arduino.
2. Connect a wire to A0 on the Arduino, and any other analog inputs you plan to use.
3. Connect the wires to any sensors or outputs being tested.

### WARNING
Do **NOT** connect more then 5 volts directly to any of the arduino inputs.


### Key bindings
* 0, 1-5 - Enable or disable graph display of analog input
* P - Pause display
* ESC - Quit


## Install
1. Install required libs
 * Project uses [gosu](https://github.com/gosu/gosu) for the GUI.  See Gosu's documentation for [Mac OSX](https://github.com/gosu/gosu/wiki/Getting-Started-on-OS-X), [Linux](https://github.com/gosu/gosu/wiki/Getting-Started-on-Linux), or [Windows](https://github.com/gosu/gosu/wiki/Getting-Started-on-Windows)
2. Run project `ruby oscilloscope.rb`
3. run `gem install oscilloscope`
4. run `oscilloscope`

## Contribute
1. Fork
2. Create Branch
3. Edit
4. Test
5. Create pull request
