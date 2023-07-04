=/  a=@  999
=/  b=@  999
=/  floor=@  900
=|  palindrome-max=@
|-
^-  @
?:  &(=(a floor) !=(b floor))
  $(a (dec b), b (dec b))
?:  =(b floor)
  ?~  palindrome-max
    $(a 999, b 999, floor (sub floor 50))
  palindrome-max
=/  product=@  (mul a b)
=/  string=tape  (scow %ud product)
?:  =(string (flop string))
  $(a (dec a), palindrome-max (max palindrome-max product))
$(a (dec a))
