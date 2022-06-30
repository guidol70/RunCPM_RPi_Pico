# RunCPM_RPi_Pico
RunCPM for the Raspberry Pico

![RunCPM_Pico_BootUpScreen](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/GL20220629_RP2040_222.jpg?raw=true)

Is using much of the RunCPM-Code for a Arduno-DUE (also HostOS 0x01 from the .ino)

does need
- SDCard interface with SPI

   SD card attached to SPI bus as follows:<br/>
   // Arduino-pico core<br/>
   ** MISO - pin GP16<br/>
   ** MOSI - pin GP19<br/>
   ** CS   - pin GP17<br/>
   ** SCK  - pin GP18<br/>

- RP2040 Hardware-/Board Support https://github.com/earlephilhower/arduino-pico
    - delete included v2.0.2 SDFat-Library (does not support all features needed by RunCPM)
      \AppData\Local\Arduino15\packages\rp2040\hardware\rp2040\1.9.5\libraries\SdFat
- SDFat v2.10 Library (does support all features needed by RunCPM)

RunCPM for Pico can be compiled in the Arduino-IDE up to 250Mhz<br/>
With 275Mhz or 300Mhz RunCPM does not start up.

### 34.78% speedup when you compile with .O3 option (at 250Mhz)
### around 6.4 times faster - 25.6Mhz - 
### than a Z80 with 4Mhz (Philips P2500 Z80@4MHz) :
```
In
C:\Users\guido\AppData\Local\Arduino15\packages\rp2040\hardware\rp2040\1.9.5\platform.txt
(to find the file replace guido with your username )

-Os
====

compiler.flags=-Os -march=armv6-m -mcpu=cortex-m0plus -mthumb -ffunction-sections -fdata-sections -fno-exceptions

Sketch uses 114400 bytes (5%) of program storage space. Maximum is 2093056 bytes.
Global variables use 78800 bytes (30%) of dynamic memory, leaving 183344 bytes for local variables. Maximum is 262144 bytes.

-O3 (34.78% more speed while using 250Mhz)
==========================================

compiler.flags=-O3 -march=armv6-m -mcpu=cortex-m0plus -mthumb -ffunction-sections -fdata-sections -fno-exceptions

Sketch uses 138784 bytes (6%) of program storage space. Maximum is 2093056 bytes.
Global variables use 78772 bytes (30%) of dynamic memory, leaving 183372 bytes for local variables. Maximum is 262144 bytes.
```

### get rid / avoid the most compiler-warnings:
```
In
C:\Users\guido\AppData\Local\Arduino15\packages\rp2040\hardware\rp2040\1.9.5\platform.txt
(to find the file replace guido with your username )

change from (gnu17 and gnu++17) :
# -------------------------------------------------------------------------------------------------- 
compiler.c.flags=-c {compiler.warning_flags} {compiler.defines} {compiler.flags} {compiler.includes} -std=gnu17 -g
...
compiler.cpp.flags=-c {compiler.warning_flags} {compiler.defines} {compiler.flags} {compiler.includes} -fno-rtti -std=gnu++17 -g
# --------------------------------------------------------------------------------------------------  

change to  (gnu11 and gnu++11) - because  (gnu14 and gnu++14) doesnt work with the RP2040-compiler
# -------------------------------------------------------------------------------------------------- 
compiler.c.flags=-c {compiler.warning_flags} {compiler.defines} {compiler.flags} {compiler.includes} -std=gnu11 -g
...
compiler.cpp.flags=-c {compiler.warning_flags} {compiler.defines} {compiler.flags} {compiler.includes} -fno-rtti -std=gnu++11 -g
# -------------------------------------------------------------------------------------------------- 

because
arm-none-eabi-gcc: error: unrecognized command-line option '-std=gnu14'; did you mean '-std=gnu11'?

# -------------------------------------------------------------------------------------------------- 
In
C:\Users\guido\Documents\Arduino\libraries\SdFat\src\SDFat.h
(to find the file replace guido with your username )
comment out the warning (becausee we use File32 instead)
// #warning File not defined because __has__include(FS.h)

```

### see also (in german):<br/>
https://forum.classic-computing.de/forum/index.php?thread/25805-runcpm-auf-dem-raspberry-pi-pico<br/>

![RunCPM_Pico_Breadboard](https://github.com/guidol70/RunCPM_RPi_Pico/blob/main/Pico_Breadboard.jpg?raw=true)

![RunCPM_Pico_FrontView](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_FrontView_1024px.jpg?raw=true)

![RunCPM_Pico_RearView](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_RearView_1024px.jpg?raw=true)

![RunCPM_Pico_SDCardConnect](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_SDConnect_1024px.jpg?raw=true)

![RunCPM_Pico_ResetButton](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_ResetButton_1024px.jpg?raw=true)

![RunCPM_Pico_PinOut](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/RunCPM_Pico_SPI_SDCard.jpg?raw=true)
