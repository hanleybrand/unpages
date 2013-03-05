#!/bin/bash
# Unpages inelegantly extracts the quickview pdf from a pages file
# The photos gonna be blurry
#
# example usage:
# unpages 'why did you mail me a pages file.pages'
#
# thanks to 
# http://tldp.org/LDP/abs/html/internalvariables.html#ARGLIST for that pattern
# and
# http://laussy.org/wiki/Sanitize  for the sanitize 
#
# quality assurance level: "It worked on my machine yesterday"


E_BADARGS=85

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` [pagesfile]"
  echo "Make sure to put the filename in 'single quotes' if it has spaces or use tab to autocomplete"
  exit $E_BADARGS
fi  

echo

index=1          # Initialize count.

for arg in "$*"  # Doesn't work properly if "$*" isn't quoted.
do
  echo "Processing file #$index  $arg"
  	    filename=$arg
		 sanitized=`echo $filename | sed '
		/^%/d
		#begin transliteration table:
		s@.pages@_extracted@g
		s@, @_@g
		s@ @_@g
		s@Á@A@g
		s@Æ@AE@g
		s@Ê@E@g
		s@É@E@g
		s@Ë@E@g
		s@Ì@I@g
		s@Ý@Y@g
		s@Ù@U@g
		s@Ú@U@g
		s@Ñ@N@g
		s@\o323@O@g
		s@à@a@g
		s@æ@ae@g
		s@á@a@g
		s@ê@e@g
		s@é@e@g
		s@è@e@g
		s@ë@e@g
		s@ì@i@g
		s@ñ@n@g
		s@ó@o@g
		s@ú@u@g
		s@\o350@e@g
		s@\o351@e@g
		s@\o353@e@g
		s@\o364@o@g
		s@\o363@o@g
		s@\o361@n@g
		s@\[@(@g
		s@\]@)@g
		#end transliteration table
		'`
		  
   echo "creating dir $sanitized"
  
  	mkdir unpages
  	
  	echo "copying $arg to unpages/$sanitized"
  
  	cp "$filename" ./"unpages/$sanitized"
  	
  	cd unpages
  	
  	unzip -u ./"$sanitized"
  	
  	cp "./Quicklook/Preview.pdf" "../$sanitized.pdf"
  	
  	cd -
  
    
  
  let "index+=1"
done             # $* sees all arguments as single word. 
echo 
echo "I guess that's it"

echo

index=1          # Reset count.
                 # What happens if you forget to do this?



exit 0
