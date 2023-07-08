|^
=/  m=@  1
=|  max-concat-product=@
=|  concat-product=@
|-  ^-  @
?:  =(m 10.000)
  max-concat-product
?:  =(m 334)
  $(m 5.000)
?:  =(m 34)
  $(m 100)
?:  =(m 10)
  $(m 25)
=.  concat-product  (concat-product-n-length-gte-9 m)
=?  max-concat-product  (is-pandigital-length-9 concat-product)
  (max max-concat-product concat-product)
$(m +(m))
::
++  concat-product-n-length-gte-9
  |=  m=@
  ^-  @
  =/  n=@  2
  =/  concat-product=@  m
  |-  ^-  @
  ?:  (gte concat-product 100.000.000)
    concat-product
  %=    $
      n
    +(n)
  ::
      concat-product
    %+  add
      (mul n m)
    %+  mul
      concat-product
    (pow 10 (n-digits (mul n m)))
  ==
::
++  is-pandigital-length-9
  |=  n=@
  ^-  ?
  ?:  (gth n 999.999.999)
    |
  .=  9
  ~(wyt in (~(del in (~(del in (silt (scow %ud n))) '.')) '0'))
::
++  n-digits
  |=  n=@
  ^-  @
  ?:  =(0 n)
    1
  |-  ^-  @
  ?:  =(0 n)
    0
  +($(n (div n 10)))
::
--
