=<
::  main part
=/  abundant-list=(list @)
  %+  skim
    (gulf 12 28.123)
  |=(=atom (gth (sum-proper-divisors atom) atom))
=|  sums-two-abundant=(set @)
=/  i=@  0
=/  j=@  0
=.  sums-two-abundant
  |-
  ^-  (set @)
  ?:  (gth (snag i abundant-list) 28.111)
    sums-two-abundant
  ?:  (gth (add (snag i abundant-list) (snag j abundant-list)) 28.123)
    $(i +(i), j +(i))
  $(j +(j), sums-two-abundant (~(put in sums-two-abundant) (add (snag i abundant-list) (snag j abundant-list))))
b:(~(rep in (~(dif in (silt (gulf 1 28.123))) sums-two-abundant)) add)
::
|%
++  proper-divisors
  |=  n=@
  ^-  (set @)
  ?:  =(n 1)
    *(set @)
  =/  factors=(map @ @)  (prime-factors n)
  =/  primes=(list @)  ~(tap in ~(key by factors))
  =/  factors-list=(list @)
    =|  out=(list @)
    =/  i=@  0
    |-
    ?:  =(i (lent primes))
      out
    %=  $
      out  (weld out (reap (~(got by factors) (snag i primes)) (snag i primes)))
      i  +(i)
    ==
  ?:  =(1 (lent factors))  ::  1 is the only proper divisor of a prime
    (silt ~[1])
  =/  choices-from-factors=(list (list @))  (all-nonempty-noncomplete-choices factors-list)
  =/  j=@  0
  =/  proper-divisors=(set @)  (silt ~[1])
  =.  proper-divisors
    |-
    ^-  (set @)
    ?:  =(j (lent choices-from-factors))
      proper-divisors
    $(j +(j), proper-divisors (~(put in proper-divisors) (roll (snag j choices-from-factors) mul)))
  proper-divisors
++  sum-proper-divisors
  |=  n=@
  ^-  @
  (~(rep in (proper-divisors n)) add)
::
++  all-nonempty-noncomplete-choices
::  returns all choices from a list except for null list and the original list
  |=  array=(list @)
  ^-  (list (list @))
  =/  i=@  1
  =/  i-max=@  (dec (pow 2 (lent array)))
  =|  choices=(list (list @))
  |-
  ^-  (list (list @))
  ?:  =(i i-max)
    choices
  =/  i-copy=@  i
  =/  j=@  0
  =|  choice=(list @)
  =.  choice
    |-
    ^-  (list @)
    ?:  =(j (lent array))
      choice
    %=  $
      j  +(j)
      i-copy  (div i-copy 2)
      choice  ?:  =(1 (mod i-copy 2))
                (snoc choice (snag j array))
              choice
    ==
  $(i +(i), choices (snoc choices choice))
++  prime-factors
::  returns a map of prime factors and their powers, empty map for 1
  |=  n=@
  ^-  (map @ @)
  ?<  =(n 0)
  ?:  =(n 1)
    *(map @ @)
  ?:  |(=(n 2) =(n 3))
    (my ~[[n 1]])
  ?:  =((mod n 2) 0)
    =/  factors=(map @ @)  $(n (div n 2))
    =/  power=(unit @)  (~(get by factors) 2)
    ?~  power
      (~(put by factors) [2 1])
    (~(put by factors) [2 +(u:power)])
  ?:  =((mod n 3) 0)
    =/  factors=(map @ @)  $(n (div n 3))
    =/  power=(unit @)  (~(get by factors) 3)
    ?~  power
      (~(put by factors) [3 1])
    (~(put by factors) [3 +(u:power)])
  =/  multiple-six=@  6
  =/  n-sqrt=@  p:(sqt n)
  |-
  ^-  (map @ @)
  ?:  (gth (dec multiple-six) n-sqrt)
    (my ~[[n 1]])
  ?:  =((mod n (dec multiple-six)) 0)
    =/  factors=(map @ @)  ^$(n (div n (dec multiple-six)))
    =/  power=(unit @)  (~(get by factors) (dec multiple-six))
    ?~  power
      (~(put by factors) [(dec multiple-six) 1])
    (~(put by factors) [(dec multiple-six) +(u:power)])
  ?:  =((mod n +(multiple-six)) 0)
    =/  factors=(map @ @)  ^$(n (div n +(multiple-six)))
    =/  power=(unit @)  (~(get by factors) +(multiple-six))
    ?~  power
      (~(put by factors) [+(multiple-six) 1])
    (~(put by factors) [+(multiple-six) +(u:power)])
  $(multiple-six (add multiple-six 6))
::
--
