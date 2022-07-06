from machine import Pin, UART
import time

LED = Pin(25, Pin.OUT)
uart = UART(1, 9600)
uart.init(9600, bits=8, parity=None, stop=1)

while True:
    val = uart.read()
    
    if val == 1:
        LED.on()
        time.sleep(0.5)
    else:
        LED.off()
        time.sleep(0.5)