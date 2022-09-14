#include <SoftwareSerial.h>
#include <Servo.h>

Servo myservo;
Servo Wrist;
Servo Wrist2;
Servo Elbow;
Servo Shoulder;
Servo Base;

int pos = 0;    // variable to store the servo position
int pos1 = 0;
int pos2 = 0;
int pos3 = 30;    // variable to store the servo position
int pos4 = 0;
int pos5 = 0;

void setup() {
  myservo.attach(5);
  Wrist.attach(6);
  Wrist2.attach(7);
  Elbow.attach(8);
  Shoulder.attach(9);
  Base.attach(10);

  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    char data = Serial.read(); // data coming from bluetooth
    Serial.print(data);
    //for gripper
    if (data == 'A') {
      for (pos = 0; pos < 160; pos += 1) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
        delay(10);                       // waits 15ms for the servo to reach the position
      }
    }
    else if (data == 'B') {
      for (pos = 160; pos > 0; pos -= 1) { // goes from 180 degrees to 0 degrees
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
        delay(10);
      }// waits 15ms for the servo to reach the position
    }
    //wrist
    if (data == 'C') {
      for (pos1 = 0; pos1 < 160; pos1 += 1) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        Wrist.write(pos1);              // tell servo to go to position in variable 'pos'
       // delay(10);                       // waits 15ms for the servo to reach the position
      }
    }
    else if (data == 'D') {
      for (pos1 = 160; pos1 > 0; pos1 -= 1) { // goes from 180 degrees to 0 degrees
        Wrist.write(pos1);              // tell servo to go to position in variable 'pos'
       // delay(10);
      }// waits 15ms for the servo to reach the position
    }
    //wrist2
    if (data == 'E') {
      for (pos2 = 0; pos2 < 200; pos2 += 1) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        Wrist2.write(pos2);              // tell servo to go to position in variable 'pos'
        //delay(10);                       // waits 15ms for the servo to reach the position
      }
    }
    else if (data == 'F') {
      for (pos2 = 200; pos2 > 0; pos2 -= 1) { // goes from 180 degrees to 0 degrees
        Wrist2.write(pos2);              // tell servo to go to position in variable 'pos'
       // delay(10);
      }// waits 15ms for the servo to reach the position
    }
    //elbow
    if (data == 'G') {
      for (pos3 = 30; pos3 < 270; pos3 += 1) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        Elbow.write(pos3);              // tell servo to go to position in variable 'pos'
        //delay(15);                       // waits 15ms for the servo to reach the position
      }
    }
    else if (data == 'H') {
      for (pos3 = 270; pos3 > 30; pos3 -= 1) { // goes from 180 degrees to 0 degrees
        Elbow.write(pos3);              // tell servo to go to position in variable 'pos'
        //delay(15);
      }// waits 15ms for the servo to reach the position
    }
    //Shoulder
    if (data == 'I') {
      for (pos4 = 0; pos4 < 180; pos4 += 1) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        Shoulder.write(pos4);              // tell servo to go to position in variable 'pos'
        //delay(10);                       // waits 15ms for the servo to reach the position
      }
    }
    else if (data == 'J') {
      for (pos4 = 180; pos4 > 10; pos4 -= 1) { // goes from 180 degrees to 0 degrees
        Shoulder.write(pos4);              // tell servo to go to position in variable 'pos'
        //delay(10);
      }// waits 15ms for the servo to reach the position
    }
    //Base
    if (data == 'K') {
      for (pos5 = 0; pos5 < 90; pos5 += 1) { // goes from 0 degrees to 180 degrees
        // in steps of 1 degree
        Base.write(pos5);              // tell servo to go to position in variable 'pos'
        delay(10);                       // waits 15ms for the servo to reach the position
      }
    }
    else if (data == 'L') {
      for (pos5 = 90; pos5 > 0; pos5 -= 1) { // goes from 180 degrees to 0 degrees
        Base.write(pos5);              // tell servo to go to position in variable 'pos'
        delay(10);
      }// waits 15ms for the servo to reach the position
    }

  }
}
