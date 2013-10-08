# perl2python python module
# by george caley!
# has a few functions that come in handy

import sys

ARGV = sys.argv[1:]

def num(s):
	"""Converts a variable to the appropriate number type."""
	if type(s) == str:
		if len(s) == 0:
			return 0
		elif "." in s:
			return float(s)
		else:
			return int(s)
	elif type(s) == list:
		return len(s)
	else:
		return s

def string(s):
	"""Converts something to a string, Perl style."""
	if type(s) == list:
		return "".join(map(string, s))
	else:
		return str(s)

def open(s):
	"""Functions the same as Python's open function, except that trying to open '-' will return stdin."""
	if s == "-":
		return sys.stdin
	return open(s)

__current_file = None
__started_with_args = len(ARGV) > 0
def input():
	"""Reads lines from files given on the command line, or stdin if none are provided (emulates <> in Perl)."""

	global __current_file
	global __started_with_args	

	# no arguments: read from STDIN
	if not __started_with_args:
		return sys.stdin.readline()

	if not __current_file:
		# open a file
		if len(ARGV):
			__current_file = __open(ARGV[0])
			del ARGV[0]
		else:
			return None

		return __input()

	line = __current_file.readline()
	if not line:
		# file is finished! close the handle
		__current_file.close()
		__current_file = None

		return __input()

	return line

def chomp(s):
	"""Removes a single newline from a string."""
	if s.endswith("\n"):
		return s[:-1]
	else:
		return s