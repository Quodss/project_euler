::  Ugly solution, takes 5-7 minutes to compute
::
|^
~>  %bout
%+  roll
  (gulf 0 3.265.919)
|=  [n=@ acc=@]
=+  pan=(construct-pandigital n)
?.  (check-property pan)
  acc
(add acc pan)
::
++  check-property
  |=  n=@
  ^-  ?
  =/  d-2-d-3-d-4=@   (mod (div n (pow 10 6)) 1.000)
  =/  d-3-d-4-d-5=@   (mod (div n (pow 10 5)) 1.000)
  =/  d-4-d-5-d-6=@   (mod (div n (pow 10 4)) 1.000)
  =/  d-5-d-6-d-7=@   (mod (div n (pow 10 3)) 1.000)
  =/  d-6-d-7-d-8=@   (mod (div n (pow 10 2)) 1.000)
  =/  d-7-d-8-d-9=@   (mod (div n 10) 1.000)
  =/  d-8-d-9-d-10=@  (mod n 1.000)
  ?&  =(0 (mod d-8-d-9-d-10 17))
      =(0 (mod d-7-d-8-d-9 13))
      =(0 (mod d-6-d-7-d-8 11))
      =(0 (mod d-5-d-6-d-7 7))
      =(0 (mod d-4-d-5-d-6 5))
      =(0 (mod d-3-d-4-d-5 3))
      =(0 (mod d-2-d-3-d-4 2))
  ==
::  ++construct-pandigital: make a pandigital number from index
::  there are 9*9! = 3.265.920 pandigital numbers in total
::
++  construct-pandigital
  |=  index=@
  ^-  @
  ?>  (lte index 3.265.919)
  =/  digits=(list @)  (gulf 0 9)
  =/  n=@  (snag +((mod index 9)) digits)
  =.  digits  (oust [+((mod index 9)) 1] digits)
  =.  index  (div index 9)
  =+  i=9
  |-  ^-  @
  ?:  (gte n 1.023.456.789)
    n
  ?>  (gte i 1)
  ?>  =((lent digits) i)
  %=  $
    index  (div index i)
    i      (dec i)
    n      (add (mul n 10) (snag (mod index i) digits))
    digits  (oust [(mod index i) 1] digits)
  ==
--
