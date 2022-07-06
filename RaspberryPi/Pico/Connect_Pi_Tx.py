from machine import Pin, UART
import time

sensor = Pin(18, Pin.IN)
uart = UART(0, baudrate=9600, tx=Pin(0), rx=Pin(1))
LED = Pin(25, Pin.OUT)

buffer = bytearray(255)

while True:
    reading = sensor.value()
    
    uart.write(str(reading))
    
    if reading == 1:
        LED.on()
    else:
        LED.off()