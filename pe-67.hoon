::  %say generator, no arguments, requires /triangle/txt in %base
::
/*  triangle-txt  %txt  /triangle/txt
::
:-  %say  |=  *  :-  %noun
::
|^
=/  triangle=(list (list @))
  (turn triangle-txt split-ud-cord-spaces)
::
=;  max-sums-last=(list @)
  (roll max-sums-last max)
?~  triangle  !!
=/  max-sums=(list @)  i.triangle
=/  rest-of-triangle=(list (list @))  t.triangle
|-  ^-  (list @)
?~  rest-of-triangle
  max-sums
=/  length-max-sums=@  (lent max-sums)
=.  max-sums
  =/  out=(list @)  ~[(add (snag 0 max-sums) (snag 0 i.rest-of-triangle))]
  =/  index=@  1
  |-  ^-  (list @)
  ?:  =(index length-max-sums)
    (snoc out (add (rear max-sums) (rear i.rest-of-triangle)))
  =/  max-sum=@  %+  add
                   (snag index i.rest-of-triangle)
                 %+  max
                   (snag index max-sums)
                 (snag (dec index) max-sums)
  $(out (snoc out max-sum), index +(index))
$(rest-of-triangle t.rest-of-triangle)
::
++  split-ud-cord-spaces
  |=  =cord
  ^-  (list @)
  =/  =tape  (trip cord)
  =|  out=(list @)
  |-  ^-  (list @)
  ?:  =(~ tape)
    out
  =/  tape-piece  (scag 2 tape)
  =.  tape-piece
    ?.  =('0' (snag 0 tape-piece))
      tape-piece
    (slag 1 tape-piece)
  $(out (snoc out (slav %ud (crip tape-piece))), tape (slag 3 tape))
::
--
