#!/usr/bin/python3

"""
link the dot files to home directory
"""



from subprocess import call
from os import listdir

FILES = listdir()
FILES.remove('.git')

for file in FILES:
    call(['ln', file, '../'])
