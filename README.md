# unpages

## ...or just unzip it and just drag the Preview.pdf file out
=======

## usage

At a prompt:

    ./unpages.sh 'why did you send me a pages file.pages'

or

    ./unpages.sh why\ did\ you\ send\ me\ a\ pages\ file.pages 

### This script is already too involved to have justified its own existance

So, someone sends you that file you need.  


    ".pages?  WTF?"  

You don't have iWork. Maybe you google something like ```convert pages file to pdf``` or something similar.

Eventually you select the file, hit F2, or enter or watever works on your machine and you change .pages to .zip, uncompress
what it turns out is really a .zip file anyway and then you get some files anf folders. One of the folders is called quickview
and you head into it and get out the Preview.pdf file. 

Later, when this has happened x amount of times again you begin to wonder if you could write a shell script of soemthing. 

But it's my story, and you can probably guess the rest from here.* 

## Please: 

![Just do this. Please.](https://raw.github.com/hanleybrand/unpages/master/unpages.png)

\* Actually, you may not guess that I made this not because I don't have pages, 
but because everyone I know who doesn't asks me to convert the files for them. Like they'll ever use this, anyway.  
