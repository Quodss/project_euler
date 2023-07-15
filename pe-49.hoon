|^
=/  four-digit-prime-numbers=(list @)
  %+  skim
    (gulf 1.000 9.999)
  is-prime
=/  counter=@  2
=/  len-primes=@  (lent four-digit-prime-numbers)
=/  snag-primes  (curr snag four-digit-prime-numbers)
=/  i=@  0
=|  out=(list tape)
|-  ^-  (list tape)
=*  i-loop  $
?:  =(counter 0)
  out
=/  j=@  +(i)
|-  ^-  (list tape)
=*  j-loop  $
?:  =(j len-primes)
  i-loop(i +(i))
?.  (is-permutation (snag-primes j) (snag-primes i))
  j-loop(j +(j))
=/  k=@  +(j)
|-  ^-  (list tape)
=*  k-loop  $
?:  =(k len-primes)
  j-loop(j +(j))
?.  (is-permutation (snag-primes k) (snag-primes j))
  k-loop(k +(k))
?.  =((sub (snag-primes j) (snag-primes i)) (sub (snag-primes k) (snag-primes j)))
  k-loop(k +(k))
=.  counter  (dec counter)
=.  out  (snoc out "{(a-co:co (snag-primes i))}{(a-co:co (snag-primes j))}{(a-co:co (snag-primes k))}")
k-loop(k +(k))
::
++  is-permutation
  |=  [a=@ b=@]
  =/  [a-tape=tape b-tape=tape]  [(a-co:co a) (a-co:co b)]
  ?>  =((lent a-tape) (lent a-tape))
  |-  ^-  ?
  ?~  a-tape
    &
  =/  i-a-index-b=(unit @)  (find ~[i.a-tape] b-tape)
  ?~  i-a-index-b
    |
  $(a-tape t.a-tape, b-tape (oust [u.i-a-index-b 1] b-tape))
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
