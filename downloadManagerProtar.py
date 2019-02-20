import requests, colored, sys, time, datetime, os, platform
from colored import fg, bg, attr
from time import sleep

def system():
    if platform.system() == 'Linux':
        os.system('clear')
    else:
        os.system('cls')

system()
url = input('Please Enter Your Link: ')
system()
name = input('Enter Name You want to Create: ')
system()
Format = input('Enter Your File Format: ')
system()
when = input('Do you want to start downloading now? [Y/N]: ')
system()

if when == 'Y' or when == 'y':
    print('%s%s Downloading of Your File has Started %s' %(fg('grey_50'), attr('bold'), attr('reset')))
    try:
        data = requests.get(url).content
        file = open('%s.%s'%(name, Format), 'wb')
        file.write(data)
        print('%s%s Your File has Successfully Downloaded %s' %(fg('green'), attr('bold'), attr('reset')))
    except:
        print('%s%s Your File has Not Successfully Downloaded %s' %(fg('red'), attr('bold'), attr('reset')))
        pass

else:
    minute = input('Enter Your minute: ')
    system()
    while True:
        if int(minute) == datetime.datetime.now().minute:
            print('%s%s Downloading of Your File has Started %s' %(fg('grey_50'), attr('bold'), attr('reset')))
            try:
                data = requests.get(url).content
                file = open('%s.%s'%(name, Format), 'wb')
                file.write(data)
                print('%s%s Your File has Successfully Downloaded %s' %(fg('green'), attr('bold'), attr('reset')))
            except:
                print('%s%s Your File has Successfully Downloaded %s' %(fg('red'), attr('bold'), attr('reset')))
                pass
            break
        else:
            time.sleep(1)
            continue
