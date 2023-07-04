=/  digits=(list @)  ~[0 1 2 3 4 5 6 7 8 9]
=/  position=@  999.999  :: 0-indexed
=|  permutation=(list @)
|-  ^-  (list @)
?:  =(1 (lent digits))
  (snoc permutation (rear digits))
=/  number-of-digits=@  (lent digits)
=/  total-permutations-subset=@  (roll (gulf 1 (dec number-of-digits)) mul)
=/  index=@  (div position total-permutations-subset)
=/  next-digit=@  (snag index digits)
=.  permutation  (snoc permutation next-digit)
=.  digits  (weld (scag index digits) (slag +(index) digits))
$(position (sub position (mul index total-permutations-subset)))
