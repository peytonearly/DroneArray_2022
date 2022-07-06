from machine import Pin, Signal
import time

motor = Pin(0, Pin.OUT)

while True:
    # Motor on
    motor.on()
    time.sleep(1)
    
    # Motor off
    motor.off()
    time.sleep(1)