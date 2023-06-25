|^
::  There are no 8 or 9-digit pandigital primes as those are all divisible by 3
::  Check all n = 6*k+-1, starting from the biggest
::
|^
=/  k=@  1.275.720
=|  n=@
|-  ^-  @
=.  n  (mul 6 k)
?:  ?&  (is-pandigital +(n))
        (is-prime +(n))
    ==
  +(n)
?:  ?&  (is-pandigital (dec n))
        (is-prime (dec n))
    ==
  (dec n)
$(k (dec k))
::
::
++  is-pandigital
  |=  n=@
  ^-  ?
  =/  n-tape  (a-co:co n)
  =/  n-char-set=(set char)  (silt n-tape)
  ?:  (~(has in n-char-set) '0')
    |
  ?.  =((lent n-tape) ~(wyt in n-char-set))
    |
  =+  digit=1
  |-  ^-  ?
  ?:  =(~ n-char-set)
    &
  ?:  =(digit 10)
    |
  ?.  (~(has in n-char-set) (scot %ud digit))
    |
  $(digit +(digit), n-char-set (~(del in n-char-set) (scot %ud digit)))
::
++  is-prime
  |=  n=@
  ^-  ?
  ?<  =(n 0)
  ?:  =(n 1)
    %.n
  ?:  |(=(n 2) =(n 3))
    %.y
  ?:  |(=((mod n 2) 0) =((mod n 3) 0))
    %.n
  =/  multiple-six=@  6
  =/  n-sqrt=@  p:(sqt n)
  |-
  ^-  ?
  ?:  (gth (dec multiple-six) n-sqrt)
    %.y
  ?:  |(=((mod n (dec multiple-six)) 0) =((mod n (succ multiple-six)) 0))
    %.n
  $(multiple-six (add multiple-six 6))
--
