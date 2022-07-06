from machine import Pin, PWM
import time
import math

pwm = PWM(Pin(0))
pwm.freq(50)
duty = 0
pwm.duty_u16(duty)
time.sleep(0.1)

min_duty = 2500
max_duty = 8050
min_degrees = 0
max_degrees = 180

def DegreesToDuty(degrees):
    # Increment value per degree
    duty_step = ((max_duty - min_duty) / max_degrees)
    
    if degrees > max_degrees:
        degrees = max_degrees
    elif degrees < min_degrees:
        degrees = min_degrees
        
    # Get the duty value for the degrees
    duty = math.floor((duty_step * degrees) + min_duty)
    
    # Check that value is not out of bounds
    if duty > max_duty:
        duty = max_duty
    elif duty < min_duty:
        duty = min_duty
        
    return duty

while True:
    for degrees in range(min_degrees, max_degrees, 5):
        print(degrees)
        duty = DegreesToDuty(degrees)
        pwm.duty_u16(duty)
        time.sleep(0.1)
    for degrees in range(max_degrees, min_degrees, -5):
        print(degrees)
        duty = DegreesToDuty(degrees)
        pwm.duty_u16(duty)
        time.sleep(0.1)
        