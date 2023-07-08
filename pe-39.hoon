=<
::
=|  p-max-solutions=@
=|  max-solutions=@
::  min(p) = 12
::
=/  p=@  12
::  iterate over p
::
|-
::  if p > 1.000
::
?:  (gth p 1.000)
  ::  return perimeter with max solutions
  ::
  p-max-solutions
::  if n-solutions(p) > max-solutions
::
?:  (gth (n-solutions p) max-solutions)
  ::  then update perimeter with max solutions and max-solutions and move to
  ::  the next p
  ::
  =:  p-max-solutions  p
      max-solutions    (n-solutions p)
    ==
  $(p (add p 2))
::  else move to the next p
::
$(p (add p 2))
::
::  Core
::
|%
++  n-solutions
  |=  p=@
  ^-  @
  =+  counter=0
  ::  iterate over hypotenuses c, min(c)=5
  =/  c=@  5
  ::
  |-
  ^-  @
  ::  if c >= floor(p//2)
  ::
  ?:  (gte c (div +(p) 2))
    ::  then return counter
    ::
    counter
  ::  else:
  ::  a^2 + (c-p)*a - pc +p^2/2 = 0 for correct c
  ::  Calculate discriminant
  ::
  =/  d-1=@  (add (pow c 2) :(mul 2 p c))
  =/  d-2=@  (pow p 2)
  ::  if D <= 0 or not square of an integer:
  ::
  ?:  |((lte d-1 d-2) !=(q:(sqt (sub d-1 d-2)) 0))
    ::  then go to next c
    ::
    $(c +(c))
  ::  else:
  ::  get the smallest root (short cathetus)
  ::
  =/  a-mul-2=@  (sub p (add c p:(sqt (sub d-1 d-2))))
  ::  if a is not an integer
  ::
  ?:  =((mod a-mul-2 2) 1)
    ::  then go to the next c
    ::
    $(c +(c))
  ::  else increment counter, go to the next c
  ::
  $(c +(c), counter +(counter))
::
--
