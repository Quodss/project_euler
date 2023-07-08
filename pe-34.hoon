=<
::
=/  i=@  10
=|  sum=@
|-
^-  @
?:  =(i 9.999.999)
  sum
::  sort digits of i, apply curiosity function, add i to sum if curious
=?  sum  =((curiosity-digits (sort (listify i) gth)) i)
  (add sum i)
$(i +(i))
::
|%
++  factorial
|=  n=@
^-  @
?:  |(=(n 0) =(n 1))
  1
(roll (gulf 1 n) mul)
::
++  curiosity-digits
|=  digits=(list @)
::  enable computation caching to prevent recalculating for the same digits
~+
^-  @
|-
^-  @
?~  digits
  0
(add (factorial i.digits) $(digits t.digits))
::
++  listify
::  returns list of atom's digits base 10
|=  n=@
^-  (list @)
?:  =(n 0)
  ~
[(mod n 10) $(n (div n 10))]
::
--
