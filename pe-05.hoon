=<
:: main part:
%+  roll
  ^-  (list @)
  =|  necessary-primes=(list @)
  =/  i=@  2
  |-
  ?:  =(i 21)
    necessary-primes
  $(i +(i), necessary-primes (weld (remainder-content (prime-decompose i) necessary-primes) necessary-primes))
mul
::
::  Core with helping functions
|%
++  prime-decompose
::  returns list of prime factors
|=  n=@
^-  (list @)
?<  =(n 0)
?:  =(n 1)
  ~
?:  |(=(n 2) =(n 3))
  [n]~
?:  =((mod n 2) 0)
  (weld [2]~ $(n (div n 2)))
?:  =((mod n 3) 0)
  (weld [3]~ $(n (div n 3)))
=/  multiple-six=@  6
=/  n-sqrt=@  p:(sqt n)
|-
^-  (list @)
?:  (gth (dec multiple-six) n-sqrt)
  [n]~
?:  =((mod n (dec multiple-six)) 0)
  ?:  =(n (dec multiple-six))
    [n]~
  (weld [(dec multiple-six)]~ $(n (div n (dec multiple-six))))
?:  =((mod n (succ multiple-six)) 0)
  ?:  =(n (dec multiple-six))
    [n]~
  (weld [(succ multiple-six)]~ $(n (div n (succ multiple-six))))
$(multiple-six (add multiple-six 6))
::
++  remainder-content
::  returns difference of lists content/container
|*  [content=(list *) container=(list *)]
^+  container
::  return content for empty container
?:  =(~ container)  content
::  return null for empty content
?:  =(~ content)  ~
=/  remainder  ^+  container  ~
=/  container-copy  container
|-
?.  ?=(^ content)
  remainder
=/  found  (find [i.content]~ container)
?~  found
  $(content t.content, remainder (snoc remainder i.content))
$(content t.content, container (weld (scag u.found container) (slag +(u.found) container)))
::
--
