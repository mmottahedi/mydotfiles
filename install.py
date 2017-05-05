#!/usr/bin/python3

"""
link the dot files to home directory
"""



from subprocess import call
from os import listdir

FILES = listdir()
try:
    FILES.remove('.git')
    FILES.remove('install.py')
    FILES.remove('.ropeproject')
except: pass
for file in FILES:
    call(['ln', file, '../'])
