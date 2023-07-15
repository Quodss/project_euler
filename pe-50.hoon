::  initial plan: keep computing with increasing limit until I get the right answer
::  to save time. Happens to work on the first try.
::
|^
=/  limit=@  10.000
=/  primes-below-limit=(list @)
  %-  flop
  %+  skim
    (gulf 2 limit)
  is-prime
=/  length-primes=@  (lent primes-below-limit)
=/  number-of-terms=@  length-primes
~&  length-primes
|-  ^-  @
=*  number-of-terms-loop  $
~?  =(0 (mod number-of-terms 100))  number-of-terms
=/  starting-index=@  0
|-  ^-  @
=*  starting-index-loop  $
?:  =(+(length-primes) (add starting-index number-of-terms))
  number-of-terms-loop(number-of-terms (dec number-of-terms))
=/  sum=@  0
=/  primes-sequence=(list @)  (swag [starting-index number-of-terms] primes-below-limit)
|-  ^-  @
=*  sum-loop  $
?:  (gte sum 1.000.000)
  starting-index-loop(starting-index +(starting-index))
?~  primes-sequence
  ?:  (is-prime sum)
    ~&  number-of-terms
    ~&  (lent (swag [starting-index number-of-terms] primes-below-limit))
    sum
  starting-index-loop(starting-index +(starting-index))
sum-loop(sum (add sum i.primes-sequence), primes-sequence t.primes-sequence)
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
--
