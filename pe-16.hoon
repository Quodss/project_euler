%+  roll
  =/  number=@  (pow 2 1.000)
  =|  digits=(list @)
  |-  ^-  (list @)
  ?:  =(0 number)
    digits
  $(digits (snoc digits (mod number 10)), number (div number 10))
add
