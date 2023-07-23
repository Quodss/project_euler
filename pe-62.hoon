|^
=/  number-of-digits=@  3
|-  ^-  @
~&  "number of digits: {<number-of-digits>}"
=*  n-digits-loop  $
=/  cubes=(list @)  (cubes-with-n-digits number-of-digits)
=/  cubes-digits=(list (list @ud))  (turn cubes list-digits)
=.  cubes-digits  (turn cubes-digits (curr sort lth))
=/  lent-cubes=@  (lent cubes-digits)
~&  "length of cube array: {<lent-cubes>}"
=/  i=@  0
|-  ^-  @
~?  =(0 (mod i 100))  i
=*  i-loop  $
?:  =(i (dec lent-cubes))
  n-digits-loop(number-of-digits +(number-of-digits))
=/  to-compare=(list @ud)  (snag i cubes-digits)
=/  j=@  +(i)
=/  counter=@  0
|-  ^-  @
=*  j-loop  $
?:  =(j lent-cubes)
  ?:  =(counter 4)
    (snag i cubes)
  i-loop(i +(i))
=?  counter  =(to-compare (snag j cubes-digits))
  +(counter)
j-loop(j +(j))
::
++  cubes-with-n-digits
  |=  n=@
  ^-  (list @ud)
  =|  out=(list @ud)
  =/  m=@ud  1
  |-  ^-  (list @ud)
  =/  m-cubed=@ud  (pow m 3)
  ?:  (lth m-cubed (pow 10 (dec n)))
    $(m +(m))
  ?:  (gte m-cubed (pow 10 n))
    out
  $(m +(m), out (snoc out m-cubed))
::
++  list-digits
  |=  n=@ud
  ^-  (list @ud)
  ?:  =(n 0)
    ~[0]
  =|  out=(list @ud)
  |-  ^-  (list @ud)
  ?:  =(n 0)
    out
  $(out [(mod n 10) out], n (div n 10))
::
++  digits-to-number
  |=  digits=(list @ud)
  ^-  @ud
  ?:  =(~ digits)  0
  =/  out=@ud  0
  |-  ^-  @ud
  ?~  digits  out
  $(out (add (mul out 10) i.digits), digits t.digits)
::
++  get-permutation
  |*  [i=@ a=(list)]
  ^+  a
  =/  out=_a  ~
  =.  a  (flop a)
  =/  length-a=@  (lent a)
  |-  ^+  a
  ?:  =(length-a 0)
    out
  %=  $
    out  [(snag (mod i length-a) a) out]
    i  (div i length-a)
    length-a  (dec length-a)
    a  (oust [(mod i length-a) 1] a)
  ==
::
++  factorial
  |=  n=@
  ^-  @
  ?:  |(=(n 0) =(n 1))
    1
  =/  out=@  1
  |-  ^-  @
  ?:  =(n 2)
    (mul 2 out)
  $(out (mul out n), n (dec n))
::
++  curr
  |*  [a=$-(^ *) c=*]
  |*  b=_,.+<-.a
  (a b c)
--
