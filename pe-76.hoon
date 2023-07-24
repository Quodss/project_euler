=/  [n=@ max-i=@]  [100 99]
|-  ^-  @
=*  this-gate  ..$
~+
?:  =(n 0)
  1
?:  =(n 1)
  ?:  =(max-i 0)
    0
  1
%+  roll
  (gulf 1 (min n max-i))
|=  [biggest-summand=@ acc=@]
%+  add
  acc
(this-gate (sub n biggest-summand) (min biggest-summand max-i))
