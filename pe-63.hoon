|^
=/  k=@  1
=/  count=@  0
|-  ^-  @
?:  =(k 10)
  count
=/  power=@  1
|-  ^-  @
?.  =(power (length-ud (pow k power)))
  ^$(k +(k))
$(power +(power), count +(count))
::
++  length-ud
  |=  n=@ud
  ^-  @
  ?:  =(0 n)
    1
  =/  out=@  1
  =.  n  (div n 10)
  |-  ^-  @
  ?:  =(0 n)
    out
  $(out +(out), n (div n 10))
::
--
