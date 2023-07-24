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
=;  max-sums=(list @)
  (roll max-sums max)
|-  ^-  (list @)
?:  =(1 (lent triangle))
  (rear triangle)
=/  last-row=(list @)  (rear triangle)
=/  length-last-row-minus-1=@  (dec (lent last-row))
=/  max-sums-above=(list @)  $(triangle (snip triangle))
=/  out=(list @)  ~[(add (snag 0 max-sums-above) (snag 0 last-row))]
=/  index=@  1
|-  ^-  (list @)
?:  =(index length-last-row-minus-1)
  (snoc out (add (rear max-sums-above) (rear last-row)))
%=  $
  index  +(index)
  out  %+  snoc
         out
       ::  (last-row_i + max(max-sums-above_i, max-sums-above_{i-1}))
       ::
       %+  add
         (snag index last-row)
       %+  max
         (snag index max-sums-above)
       (snag (dec index) max-sums-above)
==
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
