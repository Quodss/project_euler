=/  n=@  1
=|  number-of-values=@
::  iterate for n from 1 to 100
::
|-  ^-  @
?:  =(n 101)
  number-of-values
::  count number of values <= 1.000.000 for a given n, exploiting symmetry
::
=/  number-of-values-lte-mil=@
  =+  counter=0
  =/  r-choose-n=@  1
  =/  multiplier-nominator=@  n
  =/  multiplier-denominator=@  1
  |-  ^-  @
  ?:  (gth r-choose-n 1.000.000)
    (mul 2 counter)
  ?:  =(multiplier-nominator +((div n 2)))
    +(n)
  %=  $
    counter  +(counter)
    r-choose-n  %+  div
                  (mul r-choose-n multiplier-nominator)
                multiplier-denominator
    multiplier-nominator  (dec multiplier-nominator)
    multiplier-denominator  +(multiplier-denominator)
  ==
$(n +(n), number-of-values (add number-of-values (sub +(n) number-of-values-lte-mil)))
