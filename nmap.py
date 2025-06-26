#!/usr/bin/env python3
import pyfiglet
import time

#create  figlet object with the default font
figlet = pyfiglet.Figlet()

#Generate the ASCII art for "merry xmas"
ascii_art = figlet.renderText('welcome to Nmap Automation Tool')

#Split the ASCII ert into lines
lines = ascii_art.split('\n')

#Print each line with a delay
for line in lines:
 print(line)
 time.sleep(0.2) #Delay of 0.5 seconds between each line


print('''This tool is to assist in port scanning...

''')
print('written by blessing lomba')


