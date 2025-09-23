# RunCPM_RPi_Pico
RunCPM for the Raspberry Pico, PicoW and Pico2

![RunCPM_Pico_BootUpScreen](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_v6_8_Pico.jpg?raw=true)

![RunCPM_Pico2_BootUpScreen](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_v6_8_Pico2.jpg?raw=true)

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

RunCPM for Pico can be compiled in the Arduino-IDE up to 250Mhz<br/><br/>
[EDIT] via Ardino-IDE-Tweaks the Pico can run up to 270Mhz<br/>
and the PicoW up to 260Mhz<br/><br/>
With 275Mhz or 300Mhz RunCPM does not start up.

```
34.78% speedup when you compile with -O3 option (at 250Mhz)
around 6.4 times faster - 25.6Mhz - 
than a Z80 with 4Mhz (Philips P2500 Z80@4MHz) :
```

### Create the SDCard for Drive A:
#### copy the contents of SDCard_content.zip to a FAT16/FAT32 formatted SDCard
Infotext about the possible drives and user-areas from the original project-page 
https://github.com/MockbaTheBorg/RunCPM

RunCPM emulates the CP/M disks and user areas by means of subfolders under the RunCPM executable location, to prepare a folder or SD card for running RunCPM use the following procedures:
Create subfolders under where the RunCPM executable is located and name them "A", "B", "C" and so on, for each disk drive you intend to use, each one of these folders will be one disk drive, and under folder "A" create a subfolder named "0". This is the user area 0 of disk A:, extract the contents of A.ZIP package into this "0" subfolder. Switching to another user area inside CP/M will automatically create the respective user area subfolders, "1", "2", "3" ... as they are selected. Subfolders for the user areas 10 to 15 are created as letters "A" to "F".

All the letters for folders/subfolders and file names should be kept in uppercase, to avoid any issues of case-sensitive filesystems compatibility. CP/M only supported 16 disk drives: A: to P:, so creating other letters above P won't work, same goes for user areas above 15 (F).


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
### SD-Card-Init problem:<br>
If you got problems with the init of the SD-Card<br>
then you could try to add duplicate Power (3.3v green) and GND (blue) cables<br>
or an additional cable connection to the GND near the SPI pins (black)<br>

![SDCard_init_problem](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/Pico_RunCPM_more_Power_GND.jpg?raw=true)<br><br>

### ATTENTION:<br>
Please connect your SDCard Reader/Writer (if it has a 5v->3.3 StepDown-Converter) to 5V,<br>
because the 3.3V (OUT) rail at Pin 38 may be insuffcient to deliver enough 3.3V for the Pico and the SDCard Read/Writer :(
<br>

![RunCPM_Pico_SPI_SDCard](https://github.com/guidol70/RunCPM_RPi_Pico/raw/main/more_pictures/RunCPM_Pico_SPI_SDCard.jpg?raw=true)

