#!/usr/bin/python3
'''script to retrieve notenrollen pictures'''

import os, urllib.request
from os.path import join

input_dir = 'res/Notenrollen/'
output_dir = "res/images"

objects = os.listdir( join(input_dir,'lido'))

if not os.path.isdir( input_dir ):
    raise Exception("directory {} does not exist".format( input_dir ) )

for obj in objects:
    for pic in range(1,5):
        url = 'http://digital.deutsches-museum.de/media/%s_000%i/full/,1200/0/default.jpg' %(obj.split('.')[0], pic)
        
        if not os.path.isdir( output_dir ):
            os.makedirs( output_dir )
        file = join(
            output_dir,
            obj.split('.')[0]+'_'+str(pic)+'.jpg'
        )
        if not os.path.isfile(file):
            print('get:', url)
            try:
                urllib.request.urlretrieve(url, file)
            except:
                print('failed')
                continue
