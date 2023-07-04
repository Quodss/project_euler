=<
::main part
=/  i=@  7
|-  ^-  @
=/  triangle=@  (roll (gulf 1 i) add)
=/  factors=(map @ud @ud)  (prime-factors triangle)
?:  (gth (~(rep by factors) |=([p=[@ud @ud] q=_1] (mul +(+.p) q))) 500)
  triangle
$(i +(i))
::
::  core with helping functions
|%
++  prime-factors
::  returns a map of prime factors and their powers, empty map for 1
|=  n=@ud
^-  (map @ud @ud)
?<  =(n 0)
?:  =(n 1)
  *(map @ud @ud)
?:  |(=(n 2) =(n 3))
  (my ~[[n 1]])
?:  =((mod n 2) 0)
  =/  factors=(map @ud @ud)  $(n (div n 2))
  =/  power=(unit @ud)  (~(get by factors) 2)
  ?~  power
    (~(put by factors) [2 1])
  (~(put by factors) [2 +(u:power)])
?:  =((mod n 3) 0)
  =/  factors=(map @ud @ud)  $(n (div n 3))
  =/  power=(unit @ud)  (~(get by factors) 3)
  ?~  power
    (~(put by factors) [3 1])
  (~(put by factors) [3 +(u:power)])
=/  multiple-six=@  6
=/  n-sqrt=@  p:(sqt n)
|-
^-  (map @ud @ud)
?:  (gth (dec multiple-six) n-sqrt)
  (my ~[[n 1]])
?:  =((mod n (dec multiple-six)) 0)
  =/  factors=(map @ud @ud)  ^$(n (div n (dec multiple-six)))
  =/  power=(unit @ud)  (~(get by factors) (dec multiple-six))
  ?~  power
    (~(put by factors) [(dec multiple-six) 1])
  (~(put by factors) [(dec multiple-six) +(u:power)])
?:  =((mod n +(multiple-six)) 0)
  =/  factors=(map @ud @ud)  ^$(n (div n +(multiple-six)))
  =/  power=(unit @ud)  (~(get by factors) +(multiple-six))
  ?~  power
    (~(put by factors) [+(multiple-six) 1])
  (~(put by factors) [+(multiple-six) +(u:power)])
$(multiple-six (add multiple-six 6))
::
--
