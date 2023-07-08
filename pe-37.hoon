=<
::
::  Start with calculating right-truncatable primes.
::  This list happens to be the shortest.
::  Initiate the list with 2, 3, 5 and 7. We'll get rid of them later
::
=/  truncatable-right-list=(list @)  ~[2 3 5 7]
::  Starting from the start of the list, prepend all primes of form 10 * l_i + d
::  for each digit d.
::
=+  i=0
=.  truncatable-right-list
  |-  ^-  (list @)
  ::  once we reach the end of the list we exhausted all our options
  ::
  ?:  =(i (lent truncatable-right-list))
    truncatable-right-list
  =.  truncatable-right-list
    =/  d=@  1
    |-  ^-  (list @)
    ?:  =(d 10)
      truncatable-right-list
    =/  number-test=@
      ::  (10 * l_i + d)
      ::
      (add (mul 10 (snag i truncatable-right-list)) d)
    ?.  (is-prime number-test)
      $(d +(d))
    $(d +(d), truncatable-right-list (snoc truncatable-right-list number-test))
  $(i +(i))
::  Add together all right-truncatable primes that are also left-truncatable
::
(roll (skim truncatable-right-list is-truncatable-left) add)
::
|%
++  is-truncatable-left
  |=  n=@
  ^-  ?
  ?:  |(=(n 3) =(n 5) =(n 7))
    %.n
  ?:  =((mod n 10) 1)
    %.n
  |-  ^-  ?
  ?:  (lth n 10)
    |(=(n 3) =(n 5) =(n 7))
  ?&  (is-prime n)
      $(n (mod n (pow 10 (dec (n-digits n)))))
  ==
::  ++digit-length: returns number of digits in a given non-zero number
::
++  n-digits
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
