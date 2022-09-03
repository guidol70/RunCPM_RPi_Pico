# RunCPM_RPi_Pico
RunCPM for the Raspberry Pico

![RunCPM_Pico_BootUpScreen](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/GL20220903_RP2040_251.jpg?raw=true)

Is using much of the RunCPM-Code for a Arduno-DUE (also HostOS 0x01 from the .ino)

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

### get rid / avoid the most compiler-warnings:
```
In
C:\Users\guido\AppData\Local\Arduino15\packages\rp2040\hardware\rp2040\1.9.5\platform.txt
(to find the file replace guido with your username )
```
change from (gnu17 and gnu++17)<br>
![RunCPM_Pico_platform_from](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/platform_txt_from.jpg?raw=true)
<br><br>
change to (gnu11 and gnu++11)<br>
![RunCPM_Pico_platform_to](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/platform_txt_to.jpg?raw=true)

because of
```
arm-none-eabi-gcc: error: unrecognized command-line option '-std=gnu14'; did you mean '-std=gnu11'?
```
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

