# RunCPM_RPi_Pico
RunCPM for the Raspberry Pico

![RunCPM_Pico_BootUpScreen](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/GL20221004_RunCPM_v5_8.jpg?raw=true)

Is using much of the RunCPM-Code for a Arduino-DUE (also HostOS 0x01 from the .ino)

does need
- SDCard interface with SPI
```
   SD card attached to SPI bus as follows:
   // Arduino-pico core
   MISO - Pin 21 - GPIO 16
   MOSI - Pin 25 - GPIO 19
   CS   - Pin 22 - GPIO 17
   SCK  - Pin 24 - GPIO 18
```
- RP2040 Hardware-/Board Support https://github.com/earlephilhower/arduino-pico

RunCPM for Pico can be compiled in the Arduino-IDE up to 250Mhz<br/>
With 275Mhz or 300Mhz RunCPM does not start up.

```
34.78% speedup when you compile with -O3 option (at 250Mhz)
around 6.4 times faster - 25.6Mhz - 
than a Z80 with 4Mhz (Philips P2500 Z80@4MHz) :
```

### If you want to use the ESP8266SdFat of the RP2040 Arduino-Core
and not the (maybe) installed original SdFat-Library from Greiman:<br>
Replace #include <SdFat.h> with include <ESP8266SdFat.h> in your .ino<br>
and create the ESP8266SdFat.h in the following path<br>
```
C:\Users\[yourUser]\AppData\Local\Arduino15\packages\rp2040\hardware\rp2040\2.5.2\libraries\ESP8266SdFat\src
```
with the content
```
#include "SdFat.h"
```


### get rid / avoid the most compiler-warnings:

In

```
C:\Users\[user]\AppData\Local\Arduino15\packages\rp2040\hardware\rp2040\2.5.4\platform.txt
```
add in the top of the file where the compiler-warning-flags-lines are

```
compiler.cpp_warning_flags=-Wno-register -Werror=return-type
```
<br>
and change the compiler.cpp.flags line to

```
compiler.cpp.flags=-c {compiler.cpp_warning_flags} {compiler.defines} {compiler.flags} -MMD {compiler.includes} {build.flags.rtti} -std=gnu++17 -g -pipe
```
<br>
<br>

```
In
C:\Users\guido\Documents\Arduino\libraries\SdFat\src\SDFat.h
(to find the file replace guido with your username )
comment out the warning (because we use File32 instead)
```
![RunCPM_Pico_has_filename](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/SdFat_h_changes.jpg?raw=true)

### see also (in german):<br>
https://forum.classic-computing.de/forum/index.php?thread/25805-runcpm-auf-dem-raspberry-pi-pico<br>

![RunCPM_Pico_FrontView](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_FrontView_1024px.jpg?raw=true)

![RunCPM_Pico_RearView](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_RearView_1024px.jpg?raw=true)

![RunCPM_Pico_SDCardConnect](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_SDConnect_1024px.jpg?raw=true)

![RunCPM_Pico_ResetButton](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_ResetButton_1024px.jpg?raw=true)
<br><br>
### ATTENTION:<br>
Please connect your SDCard Reader/Writer (if it has a 5v->3.3 StepDown-Converter) to 5V,<br>
because the 3.3V (OUT) rail at Pin 38 may be insuffcient to deliver enough 3.3V for the Pico and the SDCard Read/Writer :(
<br>

![RunCPM_Pico_SPI_SDCard](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_SPI_SDCard.jpg?raw=true)

