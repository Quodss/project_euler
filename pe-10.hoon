=<
  ::  main part:
  %+  roll
    (skim (gulf 2 1.999.999) prime-check)
  add
::  Core with helping functions
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
::
--
