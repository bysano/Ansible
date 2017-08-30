#!/usr/bin/python
import os
import subprocess

result=subprocess.call(['ls','-l'])
print(result)
