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

def fopen(s):
	"""Functions the same as Python's open function, except that trying to open '-' will return stdin."""
	if s == "-":
		return sys.stdin
	return open(s)

def chomp(s):
	"""Removes a single newline from a string."""
	if s.endswith("\n"):
		return s[:-1]
	else:
		return s