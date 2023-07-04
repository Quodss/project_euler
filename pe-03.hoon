=/  n=@  600.851.475.143
=/  multiple-six=@  6
|-
^-  @
?:  =(n 1)
  1
?:  |(=(n 2) =(n 3))
  n
?:  =(0 (mod n 2))
  $(n (div n 2))
?:  =(0 (mod n 3))
  $(n (div n 3))
=/  sqrt-n=@  p:(sqt n)
?:  (gth (dec multiple-six) sqrt-n)
  n
?:  =(0 (mod n (dec multiple-six)))
  $(n (div n (dec multiple-six)), multiple-six 6)
?:  =(0 (mod n +(multiple-six)))
  $(n (div n +(multiple-six)), multiple-six 6)
$(multiple-six (add multiple-six 6))
