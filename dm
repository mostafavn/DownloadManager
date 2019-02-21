import sys, datetime, os, platform
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

name = sys.argv[2]


when = input('%s%s Do you want to start downloading now? [Y/N]:  %s' %(fg('grey_78'), attr('bold'), attr('reset')))

if when == 'Y' or when == 'y':
    print('%s%s Downloading of Your File has Started %s' %(fg('grey_50'), attr('bold'), attr('reset')))
    try:
        data = requests.get(sys.argv[1]).content
        file = open('%s'%(name), 'wb')
        file.write(data)
        print('%s%s Your File has Successfully Downloaded %s' %(fg('green'), attr('bold'), attr('reset')))
    except:
        print('%s%s Your File has Not Successfully Downloaded %s' %(fg('red'), attr('bold'), attr('reset')))
        pass

elif when == 'N' or when == 'n':
    minute = input('%s%s Enter Your minute:  %s' %(fg('grey_63'), attr('bold'), attr('reset')))
    while True:
        if int(minute) == datetime.datetime.now().minute:
            print('%s%s Downloading of Your File has Started %s' %(fg('grey_50'), attr('bold'), attr('reset')))
            try:
                data = requests.get(sys.argv[1]).content
                file = open('%s'%(name), 'wb')
                file.write(data)
                print('%s%s Your File has Successfully Downloaded %s' %(fg('green'), attr('bold'), attr('reset')))
            except:
                print('%s%s Your File has Successfully Downloaded %s' %(fg('red'), attr('bold'), attr('reset')))
                pass
            break
        else:
            sleep(1)
            continue
else:
    sys.exit()
