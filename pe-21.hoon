=<
::
=|  d-map=(map @ @)
=|  amicables=(list @)
=/  i=@  1
|-
?:  =(i 10.000)
  (roll amicables add)
=^  answ  d-map  (is-amicable i d-map)
%=  $
  i  (succ i)
  amicables  ?:  answ
               (snoc amicables i)
             amicables
==
::
::  Core library
|%
++  is-amicable
  |=  [n=@ d-map=(map @ @)]
  ^-  [? (map @ @)]
  =.  d-map
    ?:  (~(has by d-map) n)
      d-map
    (~(put by d-map) n (sum-proper-divisors n))
  =/  d-n=@  (~(got by d-map) n)
  =.  d-map
    ?:  (~(has by d-map) d-n)
      d-map
    (~(put by d-map) d-n (sum-proper-divisors d-n))
  =/  d-d-n=@  (~(got by d-map) d-n)
  ?:  &(=(n d-d-n) !=(n d-n))
    [%.y d-map]
  [%.n d-map]
::
++  sum-proper-divisors
::  define d(n)
  |=  n=@
  ^-  @
  ?:  =(n 1)
    1  ::  this is incorrect, d(1) is not defined. but it's ok for our purposes
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
  ?:  =(1 (lent factors))  ::d(prime) == 1
    1
  =/  choices-from-factors=(list (list @))  (all-nonempty-noncomplete-choices factors-list)
  =/  j=@  0
  =/  proper-divisors=(set @)  (silt ~[1])
  =.  proper-divisors
    |-
    ^-  (set @)
    ?:  =(j (lent choices-from-factors))
      proper-divisors
    $(j +(j), proper-divisors (~(put in proper-divisors) (roll (snag j choices-from-factors) mul)))
  (~(rep in proper-divisors) add)
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
