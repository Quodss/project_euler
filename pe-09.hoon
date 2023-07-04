=/  a=@  1
=/  b=@  1
=/  c=@  998
|-
^-  @
?:  =(c 0)
  %=  $
    a  +(a)
    b  1
    c  (sub 998 a)
  ==
?:  =((pow c 2) (add (pow a 2) (pow b 2)))
  :(mul a b c)
$(c (dec c), b +(b))
