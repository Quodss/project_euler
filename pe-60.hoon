::  draft
|^
=/  limit=@  1.000
|-  ^-  @
=*  solution-loop  $
=/  sieve=@ub  (erastothenes-sieve limit)
~&  "calculated sieve, size {<limit>}"
=|  composable-primes=(map @ (set @))
::  2 won't ever be in composable-primes
::
=/  p=@  3
::  map composable primes
::
=.  composable-primes
  |-  ^-  (map @ (set @))
  =*  outer-loop  $
  ?:  (gte p limit)
    composable-primes
  ?.  =(0 (cut 0 [p 1] sieve))
    outer-loop(p (add p 2))
  =/  q=@  (add p 2)
  |-  ^-  (map @ (set @))
  =*  inner-loop  $
  ?:  (gte q limit)
    outer-loop(p (add p 2))
  ?.  =(0 (cut 0 [q 1] sieve))
    inner-loop(q (add q 2))
  ?.  ?&  (is-prime (concat-ud p q))
          (is-prime (concat-ud q p))
      ==
    inner-loop(q (add q 2))
  =.  composable-primes
    ?.  (~(has by composable-primes) p)
      (~(put by composable-primes) p (silt ~[q]))
    (~(jab by composable-primes) p |=(=(set @) (~(put in set) q)))
  inner-loop(q (add q 2))
::  find five primes that are composable with each other
::
=/  composable-with-atleast=@  4
=/  p=@  3  ::  3 is definitely composable with at least one prime (7)
=|  set-to-intersect=(set @)
=|  list-intercomposable=(list @)
|-  ^-  @
=*  composable-loop  $
::  if p reached the limit - restart the solution with higher limit
::
?:  (gte p limit)
  solution-loop(limit (add limit 1.000))
::  else, if we reached the final intercomposable prime, return its sum with the
::  sum of all other intercomposable primes
::
?:  =(composable-with-atleast 0)
  (add p (roll list-intercomposable add))
::  else, if p is not in the map, continue
::
?.  (~(has by composable-primes) p)
  composable-loop(p (add p 2))
::  else, if p doesn't compose with enough primes, continue
::
?:  %+  lth
      ~(wyt in (intersect (~(got by composable-primes) p) set-to-intersect))
    composable-with-atleast
  composable-loop(p (add p 2))
::  else, sort the contents of the set p -> (set @) and check them one by one
::
=/  candidates=(list @)  (sort ~(tap in (~(got by composable-primes) p)) lth)




::
++  erastothenes-sieve
  |=  n-max=@
  ^-  @ub
  ::  0 means prime, 1 means not a prime, in order of significance
  ::
  =/  sieve=@ub  0b11
  =/  cursor=@  2
  =/  iroot-n-max=@  p:(sqt n-max)
  |-  ^-  @ub
  =*  outer-loop  $
  ?:  (gth cursor iroot-n-max)
    sieve
  ::  update sieve if cursor points at a prime
  ::
  =?  sieve  =(0 (cut 0 [cursor 1] sieve))
    =/  index=@  (mul cursor cursor)
    |-  ^-  @ub
    =*  inner-loop  $
    ?:  (gth index n-max)
      sieve
    inner-loop(index (add index cursor), sieve (con sieve (bex index)))
  outer-loop(cursor +(cursor))
::
++  prime-after-sieve
  |=  [n=@ sieve=@ub limit=@]
  =.  n  +(n)
  |-  ^-  @
  ?:  (gte n limit)
    limit
  ?:  =(0 (cut 0 [n 1] sieve))
    n
  $(n +(n))
::
++  check-remarkability
  |=  [a=@ b=@ c=@ d=@ e=@ incompatible-pairs=(map @ @)]
  =/  prime-list=(list @)  ~[a b c d e]
  =+  [i j]=[0 1]
  |-  ^-  [? (map @ @)]
  ?:  =(i 5)
    [& incompatible-pairs]
  =/  m=@  (snag i prime-list)
  ?:  ?&  (~(has by incompatible-pairs) m)
          !?=(~ (find ~[(~(got by incompatible-pairs) m)] prime-list))
      ==
    [| incompatible-pairs]
  ?:  =(j 5)
    $(i +(i), j +(+(i)))
  =/  k=@  (snag j prime-list)
  ?.  ?&  (is-prime (concat-ud m k))
          (is-prime (concat-ud k m))
      ==
    [| (~(put by incompatible-pairs) m k)]
  $(j +(j))
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
::
++  concat-ud
  |=  [a=@ b=@]
  ^-  @
  =/  pow-10=@
    =/  pow-10=@  1
    |-  ^-  @
    ?:  (gth pow-10 b)
      pow-10
    $(pow-10 (mul pow-10 10))
  (add (mul a pow-10) b)
::
--
