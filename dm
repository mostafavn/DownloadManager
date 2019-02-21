#!/usr/bin/python3
import sys, datetime, os, platform, random, math
from time import sleep
try:
    import requests
except ImportError:
    reqLib = input('you need to install Requests library, Continue? [Y/N] ')
    if reqLib == 'y' or reqLib == 'Y':
        os.system('pip3 install Requests')
    else:
        sys.exit()
try:
    import colored
except ImportError:
    colLib = input('you need to install Colored library, Continue? [Y/N] ')
    if reqLib == 'y' or reqLib == 'Y':
        os.system('pip3 install colored')
    else:
        sys.exit()
from colored import fg, bg, attr
def system():
    if platform.system() == 'Linux':
        os.system('clear')
    else:
        os.system('cls')
system()
try:
    type = requests.head(sys.argv[1]).headers.get('content-type')
    size = requests.head(sys.argv[1]).headers.get('content-length')
    b = type[type.find('/')+1:]
    name = sys.argv[2]
    if 'html' in b or 'text' in b:
        print('%s%s Your Link does not Correct %s' %(fg('light_red'), attr('bold'), attr('reset')))
        sys.exit()

    if int(size) <= 999999:
        a = round(int(size)/1000, 2)
        print('%s%s size: %s KB          type: %s         name: %s %s' %(fg('plum_4'), attr('bold'), a, b, name, attr('reset')))
    elif int(size) > 999999:
        a = round(int(size)/1000000, 2)
        print('%s%s size: %s MG          type: %s         name: %s %s' %(fg('plum_4'), attr('bold'), a, b, name, attr('reset')))
except IndexError:
    print('%s%s usage:%s'%(fg('light_red'), attr('bold'), attr('reset')), '%s%spython3 %s YourLink FileName %s' %(fg('green'), attr('bold'), sys.argv[0], attr('reset')))
    sys.exit()
except requests.exceptions.ConnectionError:
    pass
if ':' in sys.argv[-1]:
    dating = sys.argv[-1].find(':')
    hour = sys.argv[-1][:dating]
    minute = sys.argv[-1][dating+1:]
    print('%s%s Pleqase Waite! %s' %(fg('plum_4'), attr('bold'), attr('reset')))
    while True:
        if int(hour) == datetime.datetime.now().hour and int(minute) == datetime.datetime.now().minute:
            print('%s%s Downloading of Your File has Started %s' %(fg('grey_50'), attr('bold'), attr('reset')))
            try:
                data = requests.get(sys.argv[1]).content
                print('%s%s Your File has Successfully Downloaded %s' %(fg('green'), attr('bold'), attr('reset')))
                for i in '%s%s ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■SAVING■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ %s' %(fg('plum_4'), attr('bold'), attr('reset')):
                    print(i, end='')
                    sys.stdout.flush()
                    sleep(random.random()*0.10)
                file = open('%s.%s'%(sys.argv[2], type[type.find('/')+1:]), 'wb')
                file.write(data)
            except requests.exceptions.ConnectionError:
                print('%s%s No Connection, Check Your Internet %s' %(fg('red'), attr('bold'), attr('reset')))
            except:
                print('%s%s Your File has Not Successfully Downloaded %s' %(fg('red'), attr('bold'), attr('reset')))
            break
        else:
            sleep(1)
            continue
else:
    print('%s%s Downloading of Your File has Started %s' %(fg('grey_50'), attr('bold'), attr('reset')))
    try:
        data = requests.get(sys.argv[1]).content
        print('%s%s Your File has Successfully Downloaded %s' %(fg('green'), attr('bold'), attr('reset')))
        for i in '%s%s ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■SAVING■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ %s' %(fg('plum_4'), attr('bold'), attr('reset')):
            print(i, end='')
            sys.stdout.flush()
            sleep(random.random()*0.10)
        file = open('%s.%s'%(sys.argv[2], type[type.find('/')+1:]), 'wb')
        file.write(data)
    except requests.exceptions.ConnectionError:
        print('%s%s No Connection, Check Your Internet %s' %(fg('red'), attr('bold'), attr('reset')))
    except:
        print('%s%s Your File has Not Successfully Downloaded %s' %(fg('red'), attr('bold'), attr('reset')))
