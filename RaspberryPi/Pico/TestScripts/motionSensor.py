from machine import Pin
from time import sleep, sleep_ms

LED = Pin(10, Pin.OUT)
pir_sensor = Pin(15, Pin.IN)

while True:
    reading = pir_sensor.value()
    
    if reading == 1:
        LED.on()
    elif reading == 0:
        LED.off()