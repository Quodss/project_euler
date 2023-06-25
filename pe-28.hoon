=/  n-max=@  (pow 1.001 2)
=|  counter=@
=/  increment=@  2
=|  sum=@
=/  n=@  1
|-  ^-  @
?:  (gth n n-max)
  sum
?:  =(counter 4)
  $(counter 0, increment (add increment 2))
$(sum (add sum n), n (add n increment), counter +(counter))
