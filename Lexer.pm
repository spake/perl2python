package Lexer;

# perl2python lexer (converting lines of input into tokens)
# by george caley

# token types
use constant TOKENS => qw(
	COMMENT
	WORD
	SCALAR
	STRING
	NUMBER
	SEMICOLON
	EQUALS DOUBLEEQUALS POINT MATCH
	PARENTHESIS_OPEN PARENTHESIS_CLOSE
	SQUARE_OPEN SQUARE_CLOSE
	CURLY_OPEN CURLY_CLOSE
	COMMA
	PLUS INCREMENT
	MINUS DECREMENT
	MUL POW
	DIV
);

# single char token mappings
# this will hopefully clean up the lexer code a bit
# anything slightly less trivial (e.g. =, which is special because we need to test ==) 
# will need its own code
%singleCharTokens = (
	";" => SEMICOLON,
	"(" => PARENTHESIS_OPEN,
	")" => PARENTHESIS_CLOSE,
	"[" => SQUARE_OPEN,
	"]" => SQUARE_CLOSE,
	"{" => CURLY_OPEN,
	"}" => CURLY_CLOSE,
	"," => COMMA,
	"/" => DIV
);

# tokeniser states
use constant STATES => qw(
	STATE_IDLE
	STATE_COMMENT
	STATE_WORD
	STATE_SCALAR
	STATE_ARRAY
	STATE_HASH
	STATE_STRING
	STATE_NUMBER
);

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

		if ($state eq STATE_IDLE) {
			if (defined $singleCharTokens{$curr}) {
				# use a single char token mapping
				@token = (
					$singleCharTokens{$curr}
				);

				push @tokens, [@token];
				# remain in the idle state
			} elsif ($curr eq "#") {
				# start reading comment
				$state = STATE_COMMENT;
			} elsif ($curr eq "=") {
				# is it double equals?
				if ($next eq "=") {
					@token = (
						DOUBLEEQUALS
					);
					$i++;
				} elsif ($next eq ">") {
					@token = (
						POINT
					);
					$i++;
				} elsif ($next eq "~") {
					@token = (
						MATCH
					);
					$i++;
				} else {
					@token = (
						EQUALS
					);
				}

				push @tokens, [@token];
			} elsif ($curr eq "*") {
				# is it pow?
				if ($next eq "*") {
					@token = (
						POW
					);
					$i++;
				} else {
					@token = (
						MUL
					);
				}

				push @tokens, [@token];
			} elsif ($curr eq "+") {
				# is it increment?
				if ($next eq "+") {
					@token = (
						INCREMENT
					);
					$i++;
				} else {
					@token = (
						PLUS
					);
				}

				push @tokens, [@token];
			} elsif ($curr eq "-") {
				# is it decrement?
				if ($next eq "-") {
					@token = (
						DECREMENT
					);
					$i++;
				} else {
					@token = (
						MINUS
					);
				}

				push @tokens, [@token];
			} elsif ($curr eq '"' || $curr eq "'") {
				# start reading string
				$state = STATE_STRING;
                $separator = $curr;
			} elsif ($curr eq "\$") {
				# start reading scalar
				$state = STATE_SCALAR;
			} elsif ($curr eq "@") {
				# start reading array
				$state = STATE_ARRAY;
			} elsif ($curr eq "%") {
				# start reading hash
				$state = STATE_HASH;
			} elsif ($curr =~ /[A-Za-z_]/) {
				# start reading a word (stuff like keywords, function names, etc.)
				$state = STATE_WORD;
				next;
				#$value .= $curr;
			} elsif ($curr =~ /[0-9]/) {
				# start reading number
				$state = STATE_NUMBER;
				next;
				#$value .= $curr;
			}
		} elsif ($state eq STATE_COMMENT) {
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
		} elsif ($state eq STATE_STRING) {
			# keep reading until we hit the end quote
			if ($curr eq $separator) {
				# we're done
				@token = (
					STRING,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			} elsif ($curr eq "\\") {
				# is it a backslash followed by a quote?
				if ($next eq $separator) {
                    # consume just the quote
					$value .= $next;
					$i++;
                } elsif ($next eq "\\") {
                    # consume both backslashes
                    $value .= $curr;
                    $value .= $next;
                    $i++;
				} else {
                    # consume it like normal
                    $value .= $curr;
                }
			} else {
				# consume char
				$value .= $curr;
			}
		} elsif ($state eq STATE_SCALAR || $state eq STATE_ARRAY || $state eq STATE_HASH) {
			# consume char
			$value .= $curr;

			# keep reading until we hit something unusual
			if (!($next =~ /[A-Za-z0-9_]/)) {
				# end of name
				if ($state eq STATE_SCALAR) {
					$type = SCALAR;
				} elsif ($state eq STATE_ARRAY) {
					$type = ARRAY;
				} elsif ($state eq STATE_HASH) {
					$type = HASH;
				}

				@token = (
					$type,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			}
		} elsif ($state eq STATE_WORD) {
			# consume char
			$value .= $curr;

			if (!($next =~ /[A-Za-z0-9_]/)) {
				# end of function name
				@token = (
					WORD,
					$value
				);

				push @tokens, [@token];
				$state = STATE_IDLE;
				$value = "";
			}
		} elsif ($state eq STATE_NUMBER) {
			# consume char
			$value .= $curr;

			if (!($next =~ /[0-9]/)) {
				# end of number
				@token = (
					NUMBER,
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
