=/  factorial
  |=  n=@
  ^-  @
  ?:  |(=(n 1) =(n 0))
    1
  (mul n $(n (dec n)))
%+  div
  (factorial 40)
(pow (factorial 20) 2)
