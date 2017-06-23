'''script to retrieve notenrollen pictures'''

import os, urllib.request

dir = 'Notenrollen/'

objects = os.listdir(dir+'lido')

for obj in objects:
    for pic in range(1,5):
        url = 'http://digital.deutsches-museum.de/media/%s_000%i/full/,1200/0/default.jpg' %(obj.split('.')[0], pic)
        file = dir+'catalogue/img/'+obj.split('.')[0]+'_'+str(pic)+'.jpg'
        if not os.path.isfile(file):
            print('get:', url)
            try:
                urllib.request.urlretrieve(url, file)
            except:
                print('failed')
                continue

