#include <LiquidCrystal_I2C.h>
#define FAN    13
#define BUZZER    6
#define FLAME  A0   

LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x3F for a 16 chars and 2 line display
void vFanOn(int i16FanPin)
{
   digitalWrite(i16FanPin,1);
}
void vFanOff(int i16FanPin)
{
   digitalWrite(i16FanPin,0);
}
void FanInit (int i16FanPin)
{
  pinMode(i16FanPin,OUTPUT);
 }
void vBUZZEROn(int i16BUZZERPin)
{
   digitalWrite(i16BUZZERPin,1);
}
void vBUZZEROff(int i16BUZZERPin)
{
   digitalWrite(i16BUZZERPin,0);
}
void BUZZERInit (int i16BUZZERPin)
{
  pinMode(i16BUZZERPin,OUTPUT);
 }
void FlameInit (int i16FlamePin)
{
  pinMode(i16FlamePin,INPUT);
 }
int IntFlameRead (int i16FlamePin)
{
  return analogRead(i16FlamePin);
 }
void setup() {
  Serial.begin(115200);
  
  lcd.init();
  lcd.clear();         
  lcd.backlight();      // Make sure backlight is on
  BUZZERInit(BUZZER);
  FanInit(FAN);
  FlameInit(FLAME);
  // Print a message on both lines of the LCD.
  lcd.setCursor(0,0);   //Set cursor to character 2 on line 0
  lcd.print("WELCOME TO");
  
  lcd.setCursor(2,1);   //Move cursor to character 2 on line 1
  lcd.print("OUR PROJECT");
  // initiate the fan class

}

void loop() {
 // while(!Serial.available()); // Wait for the user to enter a string
  String num = Serial.readString(); // Read the string entered by the user
  int valueFlame = IntFlameRead(FLAME);
  if (valueFlame < 300)
  {
    
    Serial.println("A");
    delay(1);
    }
  num.trim(); // Remove any leading or trailing whitespace

  if (num.equals("1")) { // Check if the string is equal to "ahmed"
    vFanOn(FAN); 
    vBUZZEROn(BUZZER);
  }else if(num.equals("2"))
  {
    vFanOff(FAN);
    vBUZZEROff(BUZZER);
    }
    else if(num.equals("3")){
        lcd.clear(); 
        while(!Serial.available()); 
         num = Serial.readString();
         num.trim();
         lcd.setCursor(0,0); 
         lcd.print(num);
      }
    

   
}
