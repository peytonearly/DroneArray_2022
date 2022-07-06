from machine import Pin, UART
import time

sensor = Pin(28, Pin.IN)
uart = UART(1, 9600)
uart.init(9600, bits=8, parity=None, stop=1)

while True:
    reading = sensor.value()
    
    uart.write(reading)