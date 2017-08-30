#!/usr/bin/python
import os
import subprocess
output = subprocess.check_output("cat definitions/PaloAlto.yaml  | grep vnfdId | cut -f2- -d: | tr -d '\012\015'", shell=True)
output.upper()
print(output)