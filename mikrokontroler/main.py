from machine import Pin
import network
import urequests
from utime import sleep, sleep_ms

PIR_sensor = Pin(13, Pin.IN, Pin.PULL_UP)

LED = Pin(14, Pin.OUT)
BOARD_LED = Pin(28, Pin.OUT, Pin.PULL_DOWN)

LED.low()
BOARD_LED.low()

sleep_ms(3000)

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.connect("SSID", "hasło do sieci WiFi")
 
wait = 30
while wait > 0:
    BOARD_LED.high()
    if wlan.status() < 0 or wlan.status() >= 3:
        break
    wait -= 1
    print('Waiting for connection...')
    sleep(1)
    BOARD_LED.low()
 
print(wlan.status())
if wlan.status() != 3:
    raise RuntimeError('Connection failed')
else:
    print('Connected')
    BOARD_LED.low()
    ip=wlan.ifconfig()[0]
    print('IP: ', ip)

while True:
   if PIR_sensor.value() == 1:
        print("Motion Detected!")
        response = urequests.post('https://uni.morga.dev/notifications/send', json={
            "title": "Ruch wykryty", "body": "Wykryto ruch w pomieszczeniu"
        })
        
        if response.status_code == 200:
            print("Notification sent successfully")
            LED.high()
            sleep(2)
            LED.low()
            sleep_ms(30000)
            print("Waiting for next motion...")
        elif response.status_code == 202:
            print('Notification are paused.')
            
   else:
       LED.low()
       sleep_ms(200)