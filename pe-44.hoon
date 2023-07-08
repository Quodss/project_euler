|^
=/  m=@  2
=/  n=@  1
=/  pentagon-m=@  5
=/  pentagon-n=@  1
::  smallest possible difference between pentagon numbers P_m - P_n for
::  a given m. Will be used in termination condition
::  (pentagon-m - pentagon-{m-1})
::
=/  difference-min=@  (sub (mul 3 m) 2)
::  initialise D with a very big number
::
=/  d=@  (pow 2 32)
::  iterate for m from 2 to inf, for n from m-1 to 1 or until P_m - P_n > d
::
|-  ^-  @
?:  (lte d difference-min)
  d
?:  |(=(n 0) (gte (sub pentagon-m pentagon-n) d))
  %=  $
    m  +(m)
    n  m
    pentagon-m  (add pentagon-m +((mul 3 m)))
    pentagon-n  pentagon-m
    difference-min  (sub (mul 3 +(m)) 2)
  ==
=?  d  ?&  (is-pentagon (sub pentagon-m pentagon-n))
           (is-pentagon (add pentagon-n pentagon-m))
       ==
  (sub pentagon-m pentagon-n)
%=  $
  n  (dec n)
  pentagon-n  (sub pentagon-n (sub (mul 3 n) 2))
==
::
++  is-pentagon
  |=  x=@
  ^-  ?
  =+  [int-root remainder]=(sqt +((mul 24 x)))
  &(=(remainder 0) =((mod int-root 6) 5))
::
--
