# import os
import sys

sys.path.append("\Users\mernie\gtprojects\class_project\") # path to the project directory")

import classproj
import argparse

DESCRIPTION = "Shell for class project"
VERSION 	= "1.0.0"
EPILOG 		= "No bugs please"

def main (*argv):
	
		parser = argparse.ArgumentParser(description=DESCRIPTION, 
											version=VERSION, epilog=EPILOG)
		parser.add_argument('csv', nargs=1, help="Data to import")
	print argv
	
if __name__ == '__main__':
	main(*sys.argv[1:])
