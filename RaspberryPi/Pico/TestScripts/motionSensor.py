from machine import Pin, I2C
from time import sleep, sleep_ms

LED = Pin(0, Pin.OUT)
pir_sensor = Pin(15, Pin.IN)

while True:
    reading = pir_sensor.value()
    
    if reading == 1:
        LED.on()
        sleep(0.5)
    else:
        LED.off()
        sleep(0.5)