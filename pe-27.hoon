=<
::
=/  a=@sd  -999
=/  b=@sd  --3
=|  prod-out=@sd
=|  counter-max=@
|-
::  end of iteration
?:  =(a --1.001)
  prod-out
::  if b == 1001 increment a, reset b, continue
?:  =(b --1.001)
  $(a (sum --2 a), b --3)
::  if (a+1) <= -b increment b, continue
?.  =((cmp (sum --1 a) (pro -1 b)) --1)
  $(b (sum --2 b))
::  if b is not prime increment b, continue
?.  (is-prime-si b)
  $(b (sum --2 b))
=|  counter=@
=/  n=@sd  --0
=.  counter
  |-  ^-  @
  ?.  (is-prime-si (sum (sum (pro n n) (pro a n)) b))
    counter
  $(counter +(counter), n (sum n --1))
=?  prod-out  (gth counter counter-max)  (pro a b)
=.  counter-max  (max counter counter-max)
$(b (sum --2 b))
::
::
=,  si
|%
++  is-prime-si
|=  n=@sd
^-  ?
?.  (syn n)
  %.n
=/  abs-n=@  +:(old n)
?:  |(=(abs-n 1) =(abs-n 0))
  %.n
?:  |(=(abs-n 2) =(abs-n 3))
  %.y
?:  |(=((mod abs-n 2) 0) =((mod abs-n 3) 0))
  %.n
=/  multiple-six=@  6
=/  n-sqrt=@  p:(sqt abs-n)
|-
^-  ?
?:  (gth (dec multiple-six) n-sqrt)
  %.y
?:  |(=((mod abs-n (dec multiple-six)) 0) =((mod abs-n (succ multiple-six)) 0))
  %.n
$(multiple-six (add multiple-six 6))
--
