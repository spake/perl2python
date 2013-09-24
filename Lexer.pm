package Lexer;

# perl2python lexer (converting lines of input into tokens)
# by george caley

# token types
use constant COMMENT => 0;
use constant FUNCTION_NAME => 1;
use constant VARIABLE => 2;
use constant STRING => 3;
use constant SEMICOLON => 4;
use constant EQUALS => 5;
use constant DOUBLEEQUALS => 6;

# tokeniser states
use constant STATE_IDLE => 0;
use constant STATE_COMMENT => 1;
use constant STATE_FUNCTION_NAME => 2;
use constant STATE_VARIABLE => 3;
use constant STATE_STRING => 4;

# tokens are stored as arrays/tuples/something
# (type, value)
# or just (type) for shitty things maybe

use base 'Exporter';
our @EXPORT = qw/tokenise/;

sub tokenise {
	$data = shift;

	# data is just the text from the python file
	# it's now our job to chop it up into tokens
	# yay......

	# add newline to data (makes detecting the end of the last line easier)
	$data .= "\n";
	@chars = split(//, $data);

	# initialise state machine
	$state = STATE_IDLE;

	# initialise token array
	@tokens = ();

	# here is a string to store token value
	$value = "";

	# initialise current char counter
	$i = 0;

	while ($i < @chars) {

		$curr = $chars[$i]; # current char
		$next = $chars[$i+1]; # next char

		if ($state == STATE_IDLE) {
			if ($curr eq "#") {
				# start reading comment
				$state = STATE_COMMENT;
			} elsif ($curr eq ";") {
				# woah, that's a semicolon mate
				@token = (
					SEMICOLON
				);

				push @tokens, [@token];
				# stay in idle state
			} elsif ($curr eq "=") {
				# is it double equals?
				if ($next eq "=") {
					@token = (
						DOUBLEEQUALS
					);
					$i++;
				} else {
					@token = (
						EQUALS
					);
				}

				push @tokens, [@token];
			} elsif ($curr eq "\"") {
				# start reading string
				$state = STATE_STRING;
			} elsif ($curr eq "\$") {
				# start reading VARIABLE
				$state = STATE_VARIABLE;
			} elsif ($curr =~ /[A-z0-9_]/) {
				# start reading function name
				$state = STATE_FUNCTION_NAME;
				$value .= $curr;
			}
		} elsif ($state == STATE_COMMENT) {
			if ($curr eq "\n") {
				# newline! end of comment
				@token = (
					COMMENT,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			} else {
				# consume char
				$value .= $curr;
			}
		} elsif ($state == STATE_STRING) {
			# keep reading until we hit the end quote
			if ($curr eq "\"") {
				# we're done
				@token = (
					STRING,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			} elsif ($curr eq "\\") {
				# consume it
				$value .= $curr;
				# is it a backslash followed by a quote?
				if ($next eq '"') {
					# consume it as well
					$value .= $next;
					$i++;
				}
			} else {
				# consume char
				$value .= $curr;
			}
		} elsif ($state == STATE_VARIABLE) {
			# consume char
			$value .= $curr;

			# keep reading until we hit something unusual
			if (!($next =~ /[A-z0-9_]/)) {
				# end of variable name
				@token = (
					VARIABLE,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			}
		} elsif ($state == STATE_FUNCTION_NAME) {
			# consume char
			$value .= $curr;

			if (!($next =~ /[A-z0-9_]/)) {
				# end of function name
				@token = (
					FUNCTION_NAME,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			}
		}

		$i++;

	}

	return @tokens;
	
}

1;