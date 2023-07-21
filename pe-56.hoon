=/  a=@  1
=/  b=@  1
=|  max-digital-sum=@
|-  ^-  @
?:  =(a 100)
  max-digital-sum
?:  =(b 100)
  $(a +(a), b 1)
=/  a-pow-b=@  (pow a b)
=.  max-digital-sum
  %+  max
    max-digital-sum
  =/  digital-sum=@  0
  |-  ^-  @
  ?:  =(a-pow-b 0)
    digital-sum
  $(a-pow-b (div a-pow-b 10), digital-sum (add digital-sum (mod a-pow-b 10)))
$(b +(b))
