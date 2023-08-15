/*
 Controlling a servo position using a potentiometer (variable resistor)
 by Michal Rinott <http://people.interaction-ivrea.it/m.rinott>

 modified on 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Knob
*/

#include <Servo.h>

Servo servo6; 
Servo servo5;
Servo servo4;
Servo servo3;
Servo servo2;
Servo servo10;// create servo object to control a servo
Servo servo7;
Servo servo8;
Servo servo9;
int pot3 = A0;
int pot2 = A1;
int pot4 = A2;
int pot10 = A3;
int pot5 = A4;
int pot6 = A5;
int pot7 = A6;
int pot8 = A7;
int pot9 = A8;
// analog pin used to connect the potentiometer
int val6;
int val5;
int val4;
int val3;
int val2;
int val10;
int val7;
int val8;
int val9;
// variable to read the value from the analog pin

void setup() {Serial.begin(9600);
  servo6.attach(6);
  servo5.attach(5);
  servo4.attach(4);
  servo3.attach(3);
  servo2.attach(2);
  servo10.attach(10);
  servo7.attach(7);
  servo8.attach(8);
  servo9.attach(9);
  // attaches the servo on pin 9 to the servo object
}

void loop() {
  val6 = analogRead(pot6);  
  val5 = analogRead(pot5);
  val4 = analogRead(pot4);
  val3 = analogRead(pot3);
  val2 = analogRead(pot2);
  val10 = analogRead(pot10);
  val7 = analogRead(pot7);
  val8 = analogRead(pot8);
  val9 = analogRead(pot9);// reads the value of the potentiometer (value between 0 and 1023)
  val6 = map(val6, 0, 1023, 0, 180); 
  val5 = map(val5, 0, 1023, 0, 180);
  val4 = map(val4, 0, 1023, 0, 180);
  val3 = map(val3, 0, 1023, 0, 180);
  val2 = map(val2, 0, 1023, 0, 180);
  val10 = map(val10, 0, 1023, 0, 180);
  val7 = map(val7, 0, 1023, 0, 180);
  val8 = map(val8, 0, 1023, 0, 180);
  val9 = map(val9, 0, 1023, 0, 180);
  // scale it for use with the servo (value between 0 and 180)
  servo6.write(val6);
  servo5.write(val5);
  servo4.write(val4);
  servo3.write(val3);
  servo2.write(val2);
  servo10.write(val10);
  servo7.write(val7);
  servo8.write(val8);
  servo9.write(val9);
  Serial.println(val6);// sets the servo position according to the scaled value
  delay(15);                           // waits for the servo to get there
}
