|^
::
%+  roll
  (gulf 0 6)
|=  [i=@ acc=_1]
%+  mul
  acc
(champ-ith-digit (pow 10 i))
::  ++champ-ith-digit: return ith digit of Champernowne's Constant, 1-indexed
::
++  champ-ith-digit
  |=  i=@
  ^-  @
  =/  n-digits=@  1
  |-  ^-  @
  =/  index-max=@
    %+  mul
      n-digits
    (sub (pow 10 n-digits) (pow 10 (dec n-digits)))
  ?:  (lte i index-max)
    =/  number=@
      %+  add
        (pow 10 (dec n-digits))
      (div (dec i) n-digits)
    %+  ith-digit
      number
    (mod (dec i) n-digits)
  %=  $
    n-digits  +(n-digits)
    i  (sub i index-max)
  ==
::  ++ith-digit: return ith digit of n, most significant digits first, 0-indexed
::
++  ith-digit
  |=  [n=@ i=@]
  ^-  @
  (slav %ud (snag i (a-co:co n)))
::
--
