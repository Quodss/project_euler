|^
=/  nominator=@  1.393
=/  denominator=@  985
=/  i=@  8
=/  counter=@  0
|-  ^-  @
?:  =(i 1.001)
  counter
=?  counter  (more-digits nominator denominator)
  +(counter)
=/  new-nominator=@  (add nominator (mul 2 denominator))
=/  new-denominator=@  (add nominator denominator)
=/  gcd=@  d:(egcd new-nominator new-denominator)
%=  $
  i  +(i)
  nominator  (div new-nominator gcd)
  denominator  (div new-denominator gcd)
==
::
++  more-digits
  |=  [a=@ b=@]
  ^-  ?
  ?&  !=(a 0)
      |(=(b 0) $(a (div a 10), b (div b 10)))
  ==
::
--
