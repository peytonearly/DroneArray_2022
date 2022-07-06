import time
from machine import Pin

LED_0 = Pin(0, Pin.OUT)
LED_1 = Pin(1, Pin.OUT)
LED_2 = Pin(2, Pin.OUT)
LED_3 = Pin(3, Pin.OUT)

while True:
    # LEDs on
    LED_0.on()
    time.sleep(0.2)
    LED_1.on()
    time.sleep(0.2)
    LED_2.on()
    time.sleep(0.2)
    LED_3.on()
    time.sleep(0.2)
    
    # LEDs off
    LED_0.off()
    time.sleep(0.2)
    LED_1.off()
    time.sleep(0.2)
    LED_2.off()
    time.sleep(0.2)
    LED_3.off()
    time.sleep(0.2)