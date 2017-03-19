################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/FastIO.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/I2CIO.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LCD.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_I2C.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_I2C_ByVac.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SI2C.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR1W.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR2W.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR3W.cpp \
/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/SI2CIO.cpp 

LINK_OBJ += \
./libraries/LiquidCrystal_I2C/FastIO.cpp.o \
./libraries/LiquidCrystal_I2C/I2CIO.cpp.o \
./libraries/LiquidCrystal_I2C/LCD.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_I2C.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_I2C_ByVac.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SI2C.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR1W.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR2W.cpp.o \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR3W.cpp.o \
./libraries/LiquidCrystal_I2C/SI2CIO.cpp.o 

CPP_DEPS += \
./libraries/LiquidCrystal_I2C/FastIO.cpp.d \
./libraries/LiquidCrystal_I2C/I2CIO.cpp.d \
./libraries/LiquidCrystal_I2C/LCD.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_I2C.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_I2C_ByVac.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SI2C.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR1W.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR2W.cpp.d \
./libraries/LiquidCrystal_I2C/LiquidCrystal_SR3W.cpp.d \
./libraries/LiquidCrystal_I2C/SI2CIO.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/LiquidCrystal_I2C/FastIO.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/FastIO.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/I2CIO.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/I2CIO.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LCD.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LCD.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_I2C.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_I2C.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_I2C_ByVac.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_I2C_ByVac.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_SI2C.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SI2C.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_SR.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_SR1W.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR1W.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_SR2W.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR2W.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/LiquidCrystal_SR3W.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/LiquidCrystal_SR3W.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries/LiquidCrystal_I2C/SI2CIO.cpp.o: /Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C/SI2CIO.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/Applications/sloeber.app/Contents/Eclipse//arduinoPlugin/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10609 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR   -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/cores/arduino" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/variants/standard" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/SPI/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/packages/arduino/hardware/avr/1.6.17/libraries/Wire/src" -I"/Applications/sloeber.app/Contents/Eclipse/arduinoPlugin/libraries/RTClib/1.2.0" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/BMP085" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/HTU21D" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/I2Cdev" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/LiquidCrystal_I2C" -I"/Users/alangp/Documents/ArduinoEclipse/ImportLibraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


