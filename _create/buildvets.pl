#!/usr/bin/perl

use File::Copy;

## buildvets - process in chunks so builds quicker
## run from `vets`
print "buildvets - process multiple bib files so builds quicker\n\n";

## remove old temp files
opendir(DIR, "_create/_temp");
@files = grep(/\.html$/,readdir(DIR));
closedir(DIR);
foreach $file (@files) {
  unlink("_create/_temp/" . $file);
}


## move bib files into position and build
opendir(DIR, "_create");
@files = grep(/\.bib$/,readdir(DIR));
closedir(DIR);

foreach $file (sort @files) {
   $pathFile = "_create/" . $file;
   print "\nfound $pathFile\n";
   print "================================\n";
   ## copy to _bibliography & build
   copy($pathFile, "_bibliography/vetsrev.bib");
   system('jekyll build');
   ## copy output files (else overwritten) -- no need as keep_files in cfg
   ## copy _site/temp.html ie temp bibliography file + strip <ul>
   open my $in,  '<', "_site/temp.html";
   open my $out, '>', "_create/_temp/" . $file . ".html";
   while (<$in>)
   {
     # replace <ul> or </ul> with new line (so can simply cat together later)
     s/<ul class="bibliography">|<\/ul>/\n\n/;
     print $out $_;
   }
   close $in;
   close $out;
}


## finish up - merge all temp index files
open my $in,  '<', "_site/skeleton.html";   # header and footer
open my $out, '>', "_site/index.html";
while (<$in>)
{
  if (/<!-- put bibliography here -->/) {
    # grab temp files and add here
    print $out "\n\n...new stuff here...\n\n";
    opendir(DIR, "_create/_temp");
    @files = grep(/\.html$/,readdir(DIR));
    closedir(DIR);
    print "\nmerge in ...\n";
    foreach $file (sort @files) {
      print ("- " . $file . "\n");
      open my $add,  '<', "_create/_temp/" . $file;
      while (my $line = <$add>)
      {
        print $out $line;
      }
      close $add;
    }
  } else {
    # output header/footer lines
    print $out $_;
  }
}
close $in;
close $out;


## serve  (don't build - just serve what we have)
print "\n---- build done ----\n\n";
system("jekyll serve --skip-initial-build");

print "\n---- all done ----\n\n";
