|^
=/  i=@  144
=/  h=@  41.328
|-  ^-  @
?:  &((is-pentagon h) (is-triangle h))
  h
$(i +(i), h :(add h 1 (mul 4 i)))
::
++  is-pentagon
  |=  x=@
  ^-  ?
  =+  [int-root remainder]=(sqt +((mul 24 x)))
  &(=(remainder 0) =((mod int-root 6) 5))
::
++  is-triangle
  |=  n=@
  ^-  ?
  (test (sqt (lsh 0 n)))
--
