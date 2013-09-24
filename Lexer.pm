package Lexer;

# perl2python lexer (converting lines of input into tokens)
# by george caley

use base 'Exporter';
our @EXPORT = qw/tokenise/;

sub tokenise {
	$data = shift;

	# data is just the text from the python file
	# it's now our job to chop it up into tokens
	# yay......
	
}

1;