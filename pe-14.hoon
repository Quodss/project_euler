=<
::  main part:
=/  i=@  999.999
=/  lengths-map  `(map @ @)`(my [[1 1] ~])
=|  length-max=@
=|  key-max=@
|-
^-  @
?.  =(i 1)
  =/  result-cell=[@ (map @ @)]  (get-length i lengths-map)
  =.  lengths-map  +:result-cell
  =/  length=@  -:result-cell
  ?:  (gth length length-max)
    =:  length-max   length
        key-max  i
    ==
    $(i (dec i))
  $(i (dec i))
key-max
::
::  Core with helping functions
|%
++  get-length
  |=  [n=@ lengths-map=(map @ @)]
  ^-  [@ (map @ @)]
  ?:  (~(has by lengths-map) n)
    [(~(got by lengths-map) n) lengths-map]
  =/  cell-next=[@ (map @ @)]
    %=  $
        n  ?:  =((mod n 2) 0)
             (div n 2)
           +((mul 3 n))
      ==
  [+(-:cell-next) `(map @ @)`(~(put by +:cell-next) n +(-:cell-next))]
::
--
