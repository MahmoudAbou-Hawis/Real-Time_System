import serial
import time

Arduino = serial.Serial(port='COM5', baudrate=115200, timeout=0.4)
MSP432 = serial.Serial(port='COM3', baudrate=115200, timeout=0.4)


time.sleep(2)

fire = True
fire2 = True

while True:
    try:
        ArduinoValue = Arduino.readline().decode()
        MSP432Value = MSP432.readline().decode()
        print('MSP' , MSP432Value)
        print('Arduino', ArduinoValue)
        if len(ArduinoValue) > 0 and ArduinoValue[0] == 'A' :
            if fire:
                 MSP432.write(b"A")
                 fire = False
        if len(MSP432Value) > 0:
            if MSP432Value[0] == '8':
                Value = MSP432Value[1:]
                Arduino.write(b"3")
                time.sleep(1)
                Arduino.write(Value.encode())
            elif MSP432Value[0] == '1':
                if fire2 :
                    Arduino.write(b"1")
                    fire2 = False
            elif MSP432Value[0] == '2':
                Arduino.write(b"2")
                fire = True
                fire2 = True
    except Exception as e:
        print("Error sending command:", e)


