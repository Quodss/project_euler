|^
=/  m=@  2
=/  n=@  1
=/  pentagon-m=@  (pentagon m)
=/  pentagon-n=@  (pentagon n)
=/  difference-min=@  (sub (mul 3 m) 2)
::  initialise D with very big number
::
=/  d=@  (pow 2 32)
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
++  pentagon
  |=  n=@
  ^-  @
  %+  div
    %+  mul
      n
    (dec (mul 3 n))
  2
::
++  is-pentagon
  |=  x=@
  ^-  ?
  =+  [int-root remainder]=(sqt +((mul 24 x)))
  &(=(remainder 0) =((mod int-root 6) 5))
::
--
