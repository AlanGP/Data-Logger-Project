These are the libraries for the project. Two issues to note:

The SD Library is the Adafruit variant with the "SD.end()" command. Very useful when removing and reinserting the SD card. Delete the original SD library from the Arduino basic libraries folder and place this new library in your sketch folder/libraries.

The LiquidCrystal library is a renamed "NewLiquidCrystal" copy. I had difficulty in the Eclipse IDE with the original name but it worked in the Arduino IDE.
