=<
::
=/  big-number=@  (factorial 100)
=|  sum=@
|-
^-  @
?:  =(big-number 0)
  sum
$(sum (add sum (mod big-number 10)), big-number (div big-number 10))
::
|%
++  factorial
  |=  n=@
  ^-  @
  ?:  |(=(n 0) =(n 1))
    1
  (mul n $(n (dec n)))
--
