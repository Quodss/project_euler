%+  roll
  ^-  (list @)
  =|  fibonacci-even=(list @)
  =/  a=@  1
  =/  b=@  2
  |-
  ^-  (list @)
  ?:  (gth a 4.000.000)
    fibonacci-even
  ?:  =(0 (mod a 2))
    $(a b, b (add a b), fibonacci-even (snoc fibonacci-even a))
  $(a b, b (add a b))
add
