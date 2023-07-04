::  %say generator, no arguments
::
/+  number-to-words
:-  %say  |=  *  :-  %noun
::
::
=<
::
=,  eng-us:number-to-words
=|  sum=@
=/  i=@  1
|-
?:  =(1.001 i)
  sum
=/  word=tape  (murn (need (to-words i)) filter-cords)
$(i +(i), sum (add sum (lent word)))
::
::
|%
++  filter-cords
  |=  char=@t
  ^-  (unit @t)
  ?:  |(=(char ' ') =(char '-'))
    ~
  `char
--
