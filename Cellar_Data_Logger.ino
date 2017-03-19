/*
	TEMPERATURE AND HUMIDITY LONG TERM DATA LOGGER

 	Copyright (C) 2017  Alan Powell (AlanGP)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see "http://www.gnu.org/licenses".
 */

/*
   Project Details:

   Built using an Arduino Uno and Adafruit Data Logger Shield Mk2
   with a PCF 8523 Real Time Clock, a HTU21D digital Humidity and Temperature sensor
   a BMP180 barometer and a 20x4 LCD I2C text LCD.

   Additional credit to Ralph S Bacon for parts of the code
   www.youtube.com/channel/UC8Ob-HnnmhlgSv5Vs_i32TQ

   and the "Blink without Delay" sketch from the Arduino Tutorials
   and other online resources.

   This sketch uses a number of state machines in the main loop
   to individually trigger events at different times and an interrupt to detect a button press.The use of
   blocking delays and magic numbers is reduced to an absolute minimum.

   The comments are deliberately verbose, mainly for my benefit but, hopefully
   readers will experience their own Eureka moment(s) as I did working on this.
*/
/*
 ************************************Version Log***************************************
 Version 1.2.0 Recode for simplicity? - or not.
 Current Version 1.1.2 (10/03/2017)
 Version 1.1.2 Include functionality to switch on LCD for 10 Seconds in darkness (Night Light)
 (The Boolean Logic Jungle V2.0!)
 Version 1.1.1 Include functionality to toggle the LCD backlight in daylight
 (The Boolean Logic Jungle V1.0!)(Power Saving or just Showing Off?)
 Version 1.1.0 introduce state machines into main loop removing most "delay()" functions.
 Version 1.0.0 First production software in Dave's Cellar Logger - 26 Feb 2017.
 Version 0.9.0 Add LCD warning if SD Card removed or failed.
 **************************************************************************************
 */

// ----------LIBRARIES--------------
#include "Arduino.h"				//Not needed in Arduino IDE
#include <SD.h>                     //Adafruit updated library with "SD.end()").
#include <SPI.h>                    //Serial Peripherals Library (MOSI, MISO, SCLK etc.).
#include <RTClib.h>                 //Real Time Clock(s) standard library.
#include "Wire.h"                   //I2C "2 Wire" library.
#include <LiquidCrystal_I2C.h>      //I2C version of text based LCD library (Actually NewLiquidCrystal with name hacked).
#include "BMP085.h"                 //Barometer types BMP085 and BMP180.
#include "HTU21D.h"                 //HTU21D Humidity and Temperature sensor.

//--------CONSTANTS (won't change)---------------

const int buttonPin = 2;            //Defines the "LCD On" button pin as Arduino pin 2 (Interrupt 0).

static const unsigned long fiveMinutes = 300000;		// 5 minutes - delays various not all used.
//static const unsigned long fifteenMinutes = 900000;	// 15 minutes.
//static const unsigned long oneMinute = 60000;			// 60 Seconds.
//static const int thirtySeconds = 30000; 				// 30 Seconds.
static const int twentySeconds = 20000; 				// 20 Seconds.
static const int tenSeconds = 10000;    				// 10 Seconds.
static const int fiveSeconds = 5000;    				// 5 Seconds.
static const int twoSeconds = 2000;     				// 2 Seconds.
static const int oneSecond = 1000;      				// 1 Second.
static const int twoHundred = 200;        			// 200 milliSeconds.
//static const int fiftyMillis = 50;      				// 50 milliSeconds - for debounce

//------------ VARIABLES (will change)---------------------

volatile bool flagBTN = false;  // Flag for Button check.
bool flagSD = false;			// Flag for SD update timer.
bool flagLCD1 = false;          // Flag for LCD update timer.
bool flagLCD2 = false;          // Flag for change LCD Screen.
bool flagBL = true;             // Flag for backlight toggle.
bool isDebug = false;			// For Conditional Debug = "false" equals no debug.
//bool isDebug = true;			// For Conditional Debug = "true" equals debug.
bool isDark = false;			// When the LDR turns off the backlight.
bool flagNL = false;			// Flag for night light "ON" or "OFF".

unsigned long currentMillis = 0;      //Defines a "USL" variable to hold a count in milliseconds.
unsigned long previousMillisSd = 0;   //Defines a "USL" variable to remember the last time we updated the SD logger.
unsigned long previousMillisBtn = 0;  //Defines a "USL" variable to remember the last time we checked for a button press.
unsigned long previousMillisLcd = 0;  //Defines a "USL" variable to remember the last time we updated the LCD screen.
unsigned long previousMillisLcd2 = 0; //Defines a "USL" variable to remember the last time we checked for a screen change.


float pressure;						//Defines a float variable to remember the raw atmospheric pressure in Pascals (pA).
//unsigned long pressure;			// but we might get away with an unsigned long, which is better.

int milliBars;                      // Defines an integer variable to hold the converted atmospheric pressure in millibars (mB).
int darknessLevel = 0;				// An adjustable darkness level for LCD backlight switching.

int32_t lastMicros;                 // Defines a 32 bit "integer" to hold a micros count specific to the barometer measurement.

//------------ DEFINES (don't change)---------------------

#define SDmissing 7                 // Defines the SD card pin as Arduino pin 7 - Is card inserted?

#define ldrPin A0                   // Defines an analogue read of LDR voltage as Arduino pin A0.

//RTC_PCF8523 rtc;                    //Creates an instance of PCF8523 I2C Real Time Clock - Adafruit Mk2 Logger Shield
RTC_DS1307 rtc;                   //Creates an instance of DS1307 I2C Real Time Clock - Generic Chinese Logger Shield

BMP085 barometer;                   //Creates an instance of a BMP085 or BMP180 I2C Barometer - Pressure sensor

HTU21D htu21d;                      //Creates an instance of a HTU21D I2C Solid State Humidity and Temperature sensor

LiquidCrystal_I2C lcd(0x3f, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);
									//Defines the LCD type to 20x4 (20 characters in 4 rows).
									//and sets LCD to I2C Address 0x3f.

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
// Presents the day of the week with a name rather than a number
// Part of the RTC code.

//*********************************************************
//*             One size fits all Serial Monitor          *
//*  debugging messages (does not compile in Arduino IDE) *
//*               WRITTEN BY RALPH S BACON                *
//*********************************************************

template<typename T>
void debugPrint(T printMe, bool newLine = false) {
  if (isDebug) {
    if (newLine) {
      Serial.println(printMe);
    }
    else {
      Serial.print(printMe);
    }
    Serial.flush();
  }
}

void setup() // This code only happens once at startup/reset.
{
 //********************************************************
 //*       Initialise hardware and software instances     *
 //*                                                      *
 //********************************************************

  Serial.begin(9600);               //Initialise the Serial Monitor - in case we need debugging.
  debugPrint("Serial Begin", false);

  lcd.begin(20, 4);                 //Initialise the 20x4 LCD.

  Wire.begin();                     //start I2C service.

  pinMode(buttonPin, INPUT_PULLUP); //Set the button pin to an input with internal pullup resistor.

  barometer.initialize();           //Initialise barometer - Duh!

  htu21d.initialize();              //Initialise Temperature and Humidity sensor

  pinMode(SDmissing, INPUT_PULLUP); //Set the SD card missing pin to an input with internal pullup resistor

  initSDCard();                     // Common routine to connect to SD card

  lcd.backlight();                	// Start with backlight "On".

  Logo();							// Initial Title and Credits.

  SCLogo();							// Dave's special logo.

  attachInterrupt (digitalPinToInterrupt (buttonPin), switchPressed, LOW);

  //rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));  //Reset Clock to PC compile time - if required.

}
//*******************END OF SETUP**************************

//*****************START OF MAIN LOOP**********************

void loop() //This code goes around and around....and around
{
	flagBTN = false;
	//attachInterrupt (digitalPinToInterrupt (buttonPin), switchPressed, LOW);

	//********************************************************
	//*     Grab the current millis() value at the start    *
	//*                     of each loop                     *
	//*                                                      *
	//********************************************************

	currentMillis = millis();

	//********************************************************
	//*           The first "STATE" machine                  *
	//*      "Is it time to update the LCD -Yes/No"          *
	//*                                                      *
	//********************************************************

  if (currentMillis - previousMillisLcd > tenSeconds) {
    {
      flagLCD1 = true;
    }
    previousMillisLcd = currentMillis;
  }

  //********************************************************
  //*           The second "STATE" machine                 *
  //*      "Is it time to update the SD Card -Yes/No"      *
  //*                                                      *
  //********************************************************

  if (currentMillis - previousMillisSd > fiveMinutes) {
    {
      flagSD = true; // Set flag to true - time to update? = Yes.
    }
    previousMillisSd = currentMillis; // Store time of SD update.
  }

  //********************************************************
  //*           The third "STATE" machine                  *
  //*      "Is it time to swap the LCD screen - Yes/No"    *
  //*                           						   *
  //********************************************************

  if (currentMillis - previousMillisLcd2 > twentySeconds) {
    {
      flagLCD2 = true; // Set flag to true - time to check? = Yes.
    }
    previousMillisLcd2 = currentMillis; // Store time of screen change.
  }

  //********************************************************
  //*                                                      *
  //*           Now run time related functions             *
  //*                                                      *
  //********************************************************

  readBaro(); 	// Read the barometer.
  printLCD(); 	// Print data to LCD - Screen 1.
  printLCD2();  // Change LCD screen - Screen 2.
  printSD();    // Print data to SD Card.
  buttonChk();  // The button check.
  readLDR();	// Read the LDR to see if it's dark.
  nightLight();	// Check if its dark and the button is pressed.
}
//********************END OF MAIN LOOP**********************


//***********************FUNCTIONS**************************

//*************Interrupt Service Routine (ISR)**************

  void switchPressed ()
  {
	  static unsigned long last_interrupt_time = 0;
	   unsigned long interrupt_time = millis();
	   // If interrupts come faster than 200ms, assume it's a bounce and ignore
	   if (interrupt_time - last_interrupt_time > twoHundred)


	  if (digitalRead (buttonPin) == LOW) // Has the button been pressed?
	  {
		flagBTN = true; // If the button has been pressed, set flag to true.
	  }
	   //detachInterrupt (digitalPinToInterrupt (buttonPin));
  }

//***********************INITSDCARD*************************
//***************ORIGINALY BY RALPH S BACON*****************

void initSDCard()        	// The SD Card "get out of jail free" routine.
							// It resets the SD card software if the card is missing
							// or has failed and sends a message to the LCD.
{
  while (!SD.begin())
  {

    lcd.clear();

    lcd.setCursor(1, 0);
    lcd.print("SD Card not found");
    lcd.setCursor(1, 1);
    lcd.print("Insert a formatted");
    lcd.setCursor(6, 2);
    lcd.print("SD card  ");

    SD.end();
    delay(tenSeconds); // To slow this bit down.
  }

  return;
}

//**********************LOGO SCREEN*************************

void Logo()        			//Presents the opening credits to the LCD
{
  lcd.setCursor(1, 0); 		//Start at character 0 on line 0
  lcd.print("Dave's Pool Table ");
  delay(oneSecond);   		//Blocking Delay routine - not critical.
  lcd.setCursor(2, 1); 		//Start at character 2 on line 1
  lcd.print("Humidity Logger");
  delay(oneSecond);   		//Blocking Delay routine - not critical.
  lcd.setCursor(2, 3); 		//Start at character 2 on line 3
  lcd.print("(C) AGPCOM 2017");  // Me! Me! Me! Me!
  delay(twoSeconds);  		//Blocking Delay routine - not critical.
  lcd.clear();
}

//********************SOUTHERN COMFORT**********************
//*********Remove or change before Publication**************

void SCLogo() {

  lcd.setCursor(8, 0);                   // Dave's Logo
  lcd.print("It's");
  lcd.setCursor(2, 1);
  lcd.print("SOUTHERN COMFORT");         //Advertising alcohol - Tsk! Tsk!
  lcd.setCursor(6, 2);
  lcd.print("O'Clock");
  delay(fiveSeconds);  // These (blocking) delays are in setup and do not affect the loop
  lcd.clear();

}

//***********************READ BARO**************************

void readBaro()
{

  barometer.setControl(BMP085_MODE_PRESSURE_3);
  // request pressure (3x oversampling mode, high detail, 23.5ms delay)
  lastMicros = micros();
  while (micros() - lastMicros < barometer.getMeasureDelayMicroseconds());

  pressure = barometer.getPressure();
  	  	  	  	  // read calibrated pressure value in Pascals (pA)

  milliBars = (pressure / 100); // Convert Pascals to millibars (mB)

}

//**********************CHECK BUTTON************************
//****************and toggle LCD backlight******************

void buttonChk()
{
	if (flagBTN == true)
	{
		debugPrint("flagBTN = ", false);
		debugPrint(flagBTN, true);

		flagBL = !flagBL;
		debugPrint("flagBL = ", false);
		debugPrint(flagBL, true);
		if ( flagBL == true)
		{
			lcd.setBacklight(BACKLIGHT_ON);
		}
		else if ( flagBL == false)
		{
			lcd.setBacklight(BACKLIGHT_OFF);
		}

	}
//flagBTN = false;
}

//************************READ LDR**************************

void readLDR()
{
	darknessLevel = analogRead(ldrPin);
	//debugPrint(darknessLevel, true);


  if ((darknessLevel > 950) && (flagBL == true) && (flagNL == false))
	  	  	  	  	  	  	  // If it is dark AND the backlight is "ON" AND the night light is "OFF".
	  //if ((darknessLevel > 850) && (flagBL == true))
	  	  	  	  	  	  	  	  // If it is dark AND the backlight is "ON".

   {

	  lcd.setBacklight(BACKLIGHT_OFF);	// Turn the backlight "OFF"
	  isDark = true;					// Set flag - It is dark.
	  flagBL = false;					// Set the backlight is "OFF" flag.
	  debugPrint("isDark = ", false);
	  debugPrint(isDark, true);
    }
  	  //else
	  //isDark = false;					// otherwise it's not dark.
	  //debugPrint("isDark = ", false);
	  //debugPrint(isDark, true);
}

//**********************NIGHT LIGHT*************************

void nightLight()
{

	if ((flagBTN == true) && (isDark == true)) // If the button is pressed AND it is dark.
		{
		lcd.setBacklight(BACKLIGHT_ON);		// Turn the backlight "ON".
		flagNL = true;						// Set backlight flag to "ON".
		isDark = false;
		debugPrint("flagNL = ", false);
		debugPrint(flagNL, true);
		//flagBTN = false;
		delay(tenSeconds);					// Wait ten seconds.
		lcd.setBacklight(BACKLIGHT_OFF);	// Turn the backlight "OFF".
		flagNL = false;						// and reset the backlight flag to "OFF".
		debugPrint("flagNL = ", false);
		debugPrint(flagNL, true);

		}
}

//*******************FIRST LCD SCREEN***********************

void printLCD()
{
  if (flagLCD1 == true) {

    DateTime now = rtc.now(); 	//Snapshot the RTC data

    delay(oneSecond); 			//Give the RTC a second to react

    char dateBuffer[10];
    //Add a char variable/array to hold RTC data for sprintf function

    lcd.clear();
    lcd.setCursor(0, 0);

    lcd.print(daysOfTheWeek[now.dayOfTheWeek()]);
    lcd.setCursor(10, 0);

    // Use sprintf to add leading zeros to date format
    sprintf(dateBuffer, "%02u/%02u/%04u ", now.day(), now.month(), now.year());
    lcd.print(dateBuffer);

    lcd.setCursor(0, 3);
    lcd.print("Time:");         //Text
    lcd.setCursor(11, 3);

    // Use sprintf to add leading zeros to time format
    sprintf(dateBuffer, "%02u:%02u ", now.hour(), now.minute());
    lcd.println(dateBuffer);
    lcd.setCursor(17, 3);
    lcd.print("Hrs");          //Text
    lcd.setCursor(0, 1);
    lcd.print("Humidity: ");
    lcd.setCursor(13, 1);
    lcd.print(htu21d.getHumidity());
    lcd.print(" %");
    lcd.setCursor(0, 2);
    lcd.print("Temperature: ");
    lcd.print(htu21d.getTemperature());
    lcd.print(" C");

    //debugPrint("Screen 1", true);	// Conditional debug print with new line.

  }

  flagLCD1 = false;			// Reset LCD screen 2 display flag.
}

//********************SECOND LCD SCREEN*********************

void printLCD2()
{
//currentMillis = millis();
//while (millis() - currentMillis < fiveSeconds) {
if (flagLCD2 == true)

  {
    lcd.clear();
    lcd.setCursor(4, 0);
    lcd.print("Dave's Cellar");
    lcd.setCursor(0, 1);
    lcd.print("Humidity: ");
    lcd.setCursor(13, 1);
    lcd.print(htu21d.getHumidity());
    lcd.print(" %");
    lcd.setCursor(0, 2);
    lcd.print("Temperature: ");
    lcd.print(htu21d.getTemperature());
    lcd.print(" C");
    lcd.setCursor(0, 3);
    lcd.print("Pressure: ");
    lcd.setCursor(14, 3);
    lcd.print(milliBars);
    lcd.print(" mB");

    //debugPrint("Screen 2", true);	// Conditional debug print with new line.

    //delay(fiveSeconds);          // Minimum delay for screen stability

  }
  flagLCD2 = false;			// Reset LCD screen 2 display flag.
//}
}

//*********************SD CARD PRINT************************

void printSD()
{

  if (flagSD == true)
  {
    if (!digitalRead(SDmissing))      //If the SD card is not there go to the initSDCard function below, otherwise carry on

    {

      File dataLog = SD.open("SDLog.csv", FILE_WRITE); // Now able to write to file
      //DateTime now = rtc.now(); //Snapshot the RTC data
      if (dataLog) // Log data if the file "SDLog.txt" is open, otherwise go to the initSDCard function below
      {

        DateTime now = rtc.now(); //Snapshot the RTC data

        delay(oneSecond); 		//Give the RTC a second to react

        char dateBuffer[10];  	//Add a char variable/array to hold RTC data for sprintf function

        // Use sprintf to add leading zeros to date format
        sprintf(dateBuffer, "%02u/%02u/%04u", now.day(), now.month(), now.year());

        // Send data to the logfile in CSV format (no frilly stuff)
        dataLog.print(dateBuffer);
        dataLog.print(",");
        dataLog.print(daysOfTheWeek[now.dayOfTheWeek()]);
        dataLog.print(",");

        // Use sprintf to add leading zeros to time format
        sprintf(dateBuffer, "%02u:%02u", now.hour(), now.minute());
        dataLog.print(dateBuffer);
        dataLog.print(",");
        dataLog.print(htu21d.getTemperature()); //HTU21D Temperature function
        dataLog.print(",");                     //Comma - CSV
        dataLog.print(htu21d.getHumidity());    //HTU21D Humidity function
        dataLog.print(",");                     //Comma - CSV
        dataLog.print(milliBars);               //Barometric pressure in millibars
        dataLog.print(",");                     //Comma - CSV
        dataLog.println();                      //Blank line/carriage return
        dataLog.close();    // Close file - this protects the data in case of an "accident" i.e. power loss

        debugPrint("SD print complete", true);	// Conditional debug print with new line.
      }
      else
      {
        initSDCard();       //If SD Card doesn't write.
      }
    }
    else
    {
      initSDCard();         //If SD Card not found.
    }
  }
  flagSD = false;			// Reset SD flag.
}

// END OF PROGRAMME

