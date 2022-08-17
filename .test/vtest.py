import sys
import shutil
import glob
from PIL import Image
import imagehash

picnames = glob.glob('*.png')

flag = False; cut = 5 # empirical cutoff (to be adjusted...)

for file in picnames:
    newh = imagehash.dhash_vertical(Image.open('NEW/'+file))
    refh = imagehash.dhash_vertical(Image.open('REF/'+file))
    diff = abs(newh-refh)
    if diff > cut:
        print(file)
        shutil.move('NEW/'+file,'vdiffs/NEW/'+file)
        print(diff)
        shutil.move('REF/'+file,'vdiffs/REF/'+file)
        flag = True

if flag:
    print("^^^ Some vtests have failed! ^^^")
    sys.exit(1)
else:
    print("> All visual tests have been passed!")
    sys.exit(0)