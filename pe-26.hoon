=/  d=@  3
=|  length-cycle=@
=|  d-out=@
|-
^-  @
?:  =(d 1.000)
  d-out
=|  decimal-fraction=(list @)
=|  numerators=(list @)
=/  numerator=@  10
|-
^-  @
?:  =(0 (mod numerator d))
  ^$(d +(d))
=/  next-digit=@  (div numerator d)
?~  (find [numerator]~ numerators)
  %=  $
    numerator         (mul (mod numerator d) 10)
    decimal-fraction  (snoc decimal-fraction next-digit)
    numerators        (snoc numerators numerator)
  ==
=?  d-out  (gth (sub (lent decimal-fraction) (need (find [numerator]~ numerators))) length-cycle)  d
=.  length-cycle  (max length-cycle (sub (lent decimal-fraction) (need (find [numerator]~ numerators))))
^$(d +(d))
