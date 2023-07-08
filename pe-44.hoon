::  works in theory, but throws dig: meme
|^
=/  m=@  2
=/  n=@  1
=|  pentagon-m=@
=|  pentagon-n=@
=|  candidate-sub=@
=|  difference-min=@
::  initialise D with very big number
::
=/  d=@  (pow 2 32)
|-  ^-  @
~?  &(=(n 1) =(0 (mod m 1.000)))  m
?:  =(n m)
  $(m +(m), n 1)
=.  difference-min  (sub (mul 3 m) 2)
?:  (lte d difference-min)
  d
=.  pentagon-m  (pentagon m)
=.  pentagon-n  (pentagon n)
=.  candidate-sub  (sub pentagon-m pentagon-n)
?:  (gte candidate-sub d)
  $(n +(n))
=?  d  ?&  (is-pentagon candidate-sub)
           (is-pentagon (add pentagon-n pentagon-m))
       ==
  ~&  [pentagon-m pentagon-n]
  candidate-sub
$(n +(n))
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
