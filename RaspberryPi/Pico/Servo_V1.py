from machine import Pin, PWM
import time
import math

pwm = PWM(Pin(0))
pwm.freq(50)
duty = 0
pwm.duty_u16(duty)
time.sleep(0.1)

min_pulse = 900
max_pulse = 2100
min_degrees = 0
max_degrees = 120
pulse_lim = 1000000/pwm.freq()

min_duty = 100000*min_pulse/pulse_lim
max_duty = 100000*max_pulse/pulse_lim
duty_step = (max_duty - min_duty) / max_degrees

def DegreesToDuty(degrees):
    if degrees > max_degrees:
        degrees = max_degrees
    elif degrees < min_degrees:
        degrees = min_degrees
        
    duty = math.floor((duty_step * degrees) + min_duty)
    
    if duty > max_duty:
        duty = max_duty
    elif duty < min_duty:
        duty = min_duty
    
    return int(duty)

while True:
    for curr_duty in range(min_duty, max_duty, 100):
        pwm.duty_u16(int(curr_duty))
        time.sleep(0.1)
    for curr_duty in range(max_duty, min_duty, -100):
        pwm.duty_u16(int(curr_duty))
        time.sleep(0.1)