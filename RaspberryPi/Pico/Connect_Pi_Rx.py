from machine import Pin, UART
import time

LED = Pin(25, Pin.OUT)
uart = UART(0, baudrate=9600, tx=Pin(0), rx=Pin(1))

while True:
    val = uart.read()
    
    if val == str(1):
        LED.on()
    else:
        LED.off()