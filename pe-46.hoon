|^
=/  n-limit=@  10.000
=/  sieve=@ub  (erastothenes-sieve n-limit)
=/  odd-composite=@  9
::  (number to square and double)
::
=|  i=@
|-  ^-  @
=*  odd-composite-loop  $
?:  (gth odd-composite n-limit)
  ~&  "Checking up to {<(mul 10 n-limit)>}"
  odd-composite-loop(n-limit (mul 10 n-limit), sieve (sieve-prolong (mul 10 n-limit) n-limit sieve))
::  skip if `odd-composite` is prime
::
?:  =(0 (cut 0 [odd-composite 1] sieve))
  odd-composite-loop(odd-composite (add odd-composite 2))
::  else, subtract 2*i*i until we run out of i's and terminate or find prime
::  odd-composite - 2*i*i and continue the loop
::
=.  i  1
|-  ^-  @
=*  i-loop  $
?:  (lte odd-composite :(mul 2 i i))
  odd-composite
?:  =(0 (cut 0 [(sub odd-composite :(mul 2 i i)) 1] sieve))
  odd-composite-loop(odd-composite (add odd-composite 2))
i-loop(i +(i))
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
++  sieve-prolong
  |=  [n-finish=@ n-previous=@ sieve=@ub]
  ^-  @ub
  ::  remove multiples of known primes from the new part of the sieve
  ::
  =.  sieve
    =/  cursor-prime=@  2
    =|  cursor-multiple=@
    |-  ^-  @ub
    =*  primes-loop  $
    ?:  (gth cursor-prime n-previous)
      sieve
    ?.  =(0 (cut 0 [cursor-prime 1] sieve))
      primes-loop(cursor-prime +(cursor-prime))
    =.  cursor-multiple  (mul (succ (div n-previous cursor-prime)) cursor-prime)
    |-  ^-  @ub
    =*  multiples-loop  $
    ?:  (gth cursor-multiple n-finish)
      primes-loop(cursor-prime +(cursor-prime))
    multiples-loop(cursor-multiple (add cursor-multiple cursor-prime), sieve (con sieve (bex cursor-multiple)))
  ::  continue the sieving from +(n-previous) if necessary
  ::
  =/  cursor=@  +(n-previous)
  =/  iroot-n-finish=@  p:(sqt n-finish)
  |-  ^-  @ub
  =*  outer-loop  $
  ?:  (gth cursor iroot-n-finish)
    sieve
  ::  update sieve if cursor points at a prime
  ::
  =?  sieve  =(0 (cut 0 [cursor 1] sieve))
    =/  index=@  (mul cursor cursor)
    |-  ^-  @ub
    =*  inner-loop  $
    ?:  (gth index n-finish)
      sieve
    inner-loop(index (add index cursor), sieve (con sieve (bex index)))
  outer-loop(cursor +(cursor))
::
--
