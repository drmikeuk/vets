#!/usr/bin/perl

## splitvets - split bib file into chunks so can build one at a time
## run from `vets`

$input = "_create/_sourceBibs/vetsrevdemo.bib";
##$input = "_create/_sourceBibs/testsplit.bib";

print "splitvets - split bib file into chunks so can build one at a time\n\n";


@chunks = split(' ', 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z');

foreach (@chunks) {
  $cmd = "bibtool -- 'select{\$key \"^$_.*\"}' -r _create/bibtool.res " . $input . " -o _create/$_.bib";
  print "$cmd \n";
  system($cmd);
  print "----------------------------------------------------------------------\n"
}



## bibtool -- 'select{$key "^A.*"}' -r bibtool.res testsplit.bib -o testsplit-A.bib

print "\n==> done - check bib files and run _create/buildvets.pl\n\n";
