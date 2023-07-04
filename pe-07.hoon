=<
::  main part
=/  multiple-six=@  6
=/  counter=@  2  :: 2 and 3 are primes, we counted them
=/  add-or-sub=?  %.n
|-
^-  @
=/  candidate  ?:  add-or-sub
               +(multiple-six)
             (dec multiple-six)
=/  is-prime=?  (prime-check candidate)
?:  &(=(counter 10.000) is-prime)
  candidate
=.  counter  ?:  is-prime
               +(counter)
             counter
?:  add-or-sub
  $(multiple-six (add multiple-six 6), add-or-sub %.n)
$(add-or-sub %.y)
::
::  Core with helping function
|%
++  prime-check
::  returns yes if prime, no if composite or 1
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
