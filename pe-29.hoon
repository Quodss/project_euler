=|  distinct-set=(set @)
=/  a=@  2
=/  b=@  2
|-
?:  =(a 101)
  ~(wyt in distinct-set)
?:  =(b 101)
  $(a +(a), b 2)
$(b +(b), distinct-set (~(put in distinct-set) (pow a b)))
