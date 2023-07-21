|^
=/  counter=@  0
=/  number=@  1
|-  ^-  @
?:  =(number 10.000)
  counter
=/  is-lychrel=?
  =/  transformed-number=@  (add number (reverse number))
  =/  number-iterations=@  1
  |-  ^-  ?
  ?:  (is-palyndromic transformed-number)
    |
  ?:  =(number-iterations 50)
    &
  $(number-iterations +(number-iterations), transformed-number (add transformed-number (reverse transformed-number)))
=?  counter  is-lychrel  +(counter)
$(number +(number))
::
++  reverse
  |=  n=@
  =/  reversed-n=@  0
  |-  ^-  @
  ?:  =(n 0)
    reversed-n
  $(n (div n 10), reversed-n (add (mul 10 reversed-n) (mod n 10)))
::
++  is-palyndromic
  |=  n=@
  ^-  ?
  =(n (reverse n))
::
--
