# RunCPM_RPi_Pico
RunCPM for the Raspberry Pico

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

see also (in german):<br/>
https://forum.classic-computing.de/forum/index.php?thread/25805-runcpm-auf-dem-raspberry-pi-pico<br/>
