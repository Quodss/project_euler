|^
=+  [a b c d]=[210 211 212 213]
=+  four-distinct-factors-a=&
=+  four-distinct-factors-b=|
=+  four-distinct-factors-c=|
=+  four-distinct-factors-d=|
|-  ^-  @ud
~?  =(0 (mod a 10.000))  a
?:  ?&  four-distinct-factors-a
        four-distinct-factors-b
        four-distinct-factors-c
        four-distinct-factors-d
    ==
  a
%=  $
  a  b
  b  c
  c  d
  d  +(d)
  four-distinct-factors-a  four-distinct-factors-b
  four-distinct-factors-b  four-distinct-factors-c
  four-distinct-factors-c  four-distinct-factors-d
  four-distinct-factors-d  (has-four-distinct-factors +(d))
==
::
++  has-four-distinct-factors
  |=  n=@
  =/  counter=@  0
  ?:  |(=(n 1) =(n 2) =(n 3))
    |
  ::  treat prime factor 2
  ::
  =?  counter  =((mod n 2) 0)
    +(counter)
  =?  n  =((mod n 2) 0)
    |-  ^-  @
    ?.  =((mod n 2) 0)
      n
    $(n (div n 2))
  ::  treat prime factor 3
  ::
  =?  counter  =((mod n 3) 0)
    +(counter)
  =?  n  =((mod n 3) 0)
    |-  ^-  @
    ?.  =((mod n 3) 0)
      n
    $(n (div n 3))
  ::  treat prime factors 6k-+1
  ::
  =/  multiple-six=@  6
  =/  add-or-sub=?  |
  =|  divisor=@
  =|  is-divisible=?
  =/  iroot-n=@  p:(sqt n)
  |-  ^-  ?
  ?:  =(n 1)
    =(counter 4)
  ?:  =(counter 4)
    |
  ?:  (gth (dec multiple-six) iroot-n)
    $(counter +(counter), n 1)
  =.  divisor  ?:  add-or-sub
                 +(multiple-six)
               (dec multiple-six)
  =.  is-divisible  =((mod n divisor) 0)
  =?  counter  is-divisible
    +(counter)
  =?  n  is-divisible
    =.  n  (div n divisor)
    |-  ^-  @
    ?.  =((mod n divisor) 0)
      n
    $(n (div n divisor))
  ?.  add-or-sub
    $(add-or-sub !add-or-sub)
  $(add-or-sub !add-or-sub, multiple-six (add multiple-six 6))
::
--
