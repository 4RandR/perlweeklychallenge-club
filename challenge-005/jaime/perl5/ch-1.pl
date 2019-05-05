# Challenge #1
#
# Write a program which prints out all anagrams for a given word.

# collection from Webster's Second International # minus majuscule, hyphenated
my %references = (); # hash of known words.
my %anagramics = (); # words with known anagrams.

sub identifier { # permutation common to associated anagrams.
    return join "", sort split //
}

foreach (@words) {
    my $key = identifier;
    unless ($references{$key}) { # is already defined
        $references{$key} = "$_"; # map word to its sorted permutation.
    } else {
        $anagramics{$key} = "$references{$key}" unless $anagramics{$key};
        $anagramics{$key} .= ":$_"; # collect words with multiple anagrams.
    }
}

foreach (@ARGV) { # find anagrams of script arguments
    my $key = identifier;
    print "$_:$anagramics{$key}\n"; # print associated anagrams.
}