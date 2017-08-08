#!/usr/bin/python
import os

def delete(candidate):
    env = os.environ['PWD']
    home = os.getenv('OS')
    modified_candidate = candidate[:]
    print(modified_candidate)
    for index, line in enumerate(candidate):
        if line.startswith('delete'):
                del modified_candidate[index]
    print(modified_candidate, home, env)
    f = open('temp.txt', 'w')
    f.write(' /n'.join(modified_candidate).join(' /n'))
    f.close()

def main():
    delete(candidate=['sad', 'asd', 'asd', 'delete'])
if __name__ == '__main__':
    main()
