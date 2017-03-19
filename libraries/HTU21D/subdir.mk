################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D/HTU21D.cpp 

LINK_OBJ += \
./libraries/HTU21D/HTU21D.cpp.o 

CPP_DEPS += \
./libraries/HTU21D/HTU21D.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/HTU21D/HTU21D.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D/HTU21D.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


