=<
::
=/  circular-primes=(set @)  (silt ~[2])
=/  n=@  3
|-
^-  @
?:  (gte n 1.000.000)
  ~(wyt in circular-primes)
?:  (~(has in circular-primes) n)
  $(n (add n 2))
=?  circular-primes  (circularity-prime-check n)
  =/  rotations-n=(list @)  (rotations n)
  =+  i=0
  |-
  ^-  (set @)
  ?:  =(i (lent rotations-n))
    circular-primes
  (~(put in circular-primes) (snag i rotations-n))
$(n (add n 2))
::
|%
::  ++circularity-check: returns %.y if a number is prime and circular
::  and %.n otherwise
++  circularity-prime-check
  |=  n=@
  ^-  ?
  ?.  (is-prime n)
    %.n
  ?:  =((div n 10) 0)
    %.y
  =/  n-rotations=(list @)  (rotations n)
  =+  i=1
  |-
  ^-  ?
  ?:  =(i (lent n-rotations))
    %.y
  ?.  (is-prime (snag i n-rotations))
    %.n
  $(i +(i))
::  ++rotations:  returns (list @) of all digit rotations of a given number
::
++  rotations
  |=  n=@
  ^-  (list @)
  =/  list-out=(list @)  ~[n]
  =/  n-length=@  (digit-length n)
  =/  n-rotated=@
    %+  add
      (div n 10)
    (mul (pow 10 (dec n-length)) (mod n 10))
  |-
  ^-  (list @)
  ?:  =(n n-rotated)
    list-out
  %=  $
    n-rotated  %+  add
                 (div n-rotated 10)
               (mul (pow 10 (dec n-length)) (mod n-rotated 10))
    list-out  (snoc list-out n-rotated)
  ==
::  ++digit-length: returns number of digits in a given non-zero number
::
++  digit-length
  |=  n=@
  ^-  @
  ?:  =(n 0)
    0
  +($(n (div n 10)))
::  ++prime-check: returns %.y if n is prime
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
