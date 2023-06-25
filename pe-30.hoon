::  Let $f(n)=\sum_i{d_i^5}$, where $d_i$ is i$^{th}$ digit.
::  We look for numbers that satisfy $n=f(n)$
::
::  Necessary condition: sum of all digits but the last must be
::  equal to zero $mod \ 10$.  This will allow us to save some time
::  during calculations. Now let's find the upper bound.
::
::  Claim: $f(n) < n  \ \  \forall n \ge 300000$. If you try to replace
::  four last digits with any digit, $f(n)$ still won't reach 300000
::  ($4*9^5 + 3^5 < 300000$). Replacing second digit is counterproductive:
::  you'll add $d*10000$ to $n$ and $d^5$ to $f(n)$, and former is always
::  bigger then latter for any digit $d$. Same reasoning applies to
::  the first digit and to appending new digits.
::
=/  n-max=@  300.000
=|  sum=@
=/  n=@  1.000
|-
^-  @
?:  =(n n-max)
  sum
=/  last-digit=@  (mod n 10)
=/  other-digits=(list @)
  =.  n  (div n 10)
  =|  other-digits=(list @)
  |-
  ^-  (list @)
  ?:  =(0 n)
    other-digits
  $(n (div n 10), other-digits (snoc other-digits (mod n 10)))
::  necessary and sufficient conditions to save time
=?  sum  ?&  =((mod (roll other-digits add) 10) 0)
             =(n (add (pow last-digit 5) (roll (turn other-digits (curr pow 5)) add)))
         ==
  (add sum n)
$(n +(n))
