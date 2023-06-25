=<
::
=|  i=@
=|  unusual-set=(set @)
=/  i-max=@  (roll (gulf 1 9) mul)
|-
?:  =(i i-max)
  b:(~(rep in unusual-set) add)
^-  @
=/  permutation=(list @)  (ith-permutation i)
=/  prod=@  ;:  add
                (mul 1.000 (snag 5 permutation))
                (mul 100 (snag 6 permutation))
                (mul 10 (snag 7 permutation))
                (snag 8 permutation)
            ==
?:  .=  prod
    %+  mul
      (snag 0 permutation)
    ;:  add
        (mul 1.000 (snag 1 permutation))
        (mul 100 (snag 2 permutation))
        (mul 10 (snag 3 permutation))
        (snag 4 permutation)
    ==
  $(i +(i), unusual-set (~(put in unusual-set) prod))
?:  .=  prod
    %+  mul
      %+  add
        (mul 10 (snag 0 permutation))
      (snag 1 permutation)
    ;:  add
        (mul 100 (snag 2 permutation))
        (mul 10 (snag 3 permutation))
        (snag 4 permutation)
    ==
  $(i +(i), unusual-set (~(put in unusual-set) prod))
$(i +(i))
::
|%
++  ith-permutation
|=  position=@
^-  (list @)
=/  digits  (gulf 1 9)
=|  permutation=(list @)
|-
^-  (list @)
?:  =(1 (lent digits))
  (snoc permutation (rear digits))
=/  number-of-digits=@  (lent digits)
=/  total-permutations-subset=@  (roll (gulf 1 (dec number-of-digits)) mul)
=/  index=@  (div position total-permutations-subset)
=/  next-digit=@  (snag index digits)
=.  permutation  (snoc permutation next-digit)
=.  digits  (weld (scag index digits) (slag +(index) digits))
$(position (sub position (mul index total-permutations-subset)))
--
