::  terminates in finite time but too slow. rewrite with atomic vectors
::
!.
|^
=/  n=@  1
=/  list-partitions-mod-million=(list @)  ~[1]
|-  ^-  @
?>  =(n (lent list-partitions-mod-million))
=/  next-element=@  (partition-mod-million-next n list-partitions-mod-million)
?:  =(0 next-element)
  n
~?  =(0 (mod n 1.000))  n
$(n +(n), list-partitions-mod-million (snoc list-partitions-mod-million next-element))
::
++  partition-mod-million-next
  |=  [n=@ list-partitions-mod-million=(list @)]
  ^-  @
  =/  add-mod-million  ^~(~(sum fo 1.000.000))
  =/  sub-mod-million  ^~(~(dif fo 1.000.000))
  =*  this  $
  ?:  =(n 0)
    1
  =/  out=@  0
  =/  gnomon-plus-to-minus=@  1
  =/  gnomon-minus-to-plus-inc=@  3
  =/  plus-or-minus-k=?  %.y
  =/  plus-or-minus-sum=?  %.y
  =/  p=@  1
  |-  ^-  @
  =*  inner-loop  $
  ?:  (gth p n)
    out
  =.  out  ?:  plus-or-minus-sum
             (add-mod-million out (snag (sub n p) list-partitions-mod-million))
           (sub-mod-million out (snag (sub n p) list-partitions-mod-million))
  =.  p  ?:  plus-or-minus-k
           (add p gnomon-plus-to-minus)
         (add p gnomon-minus-to-plus-inc)
  =?  gnomon-plus-to-minus  plus-or-minus-k
    +(gnomon-plus-to-minus)
  =?  gnomon-minus-to-plus-inc  !plus-or-minus-k
    (add 2 gnomon-minus-to-plus-inc)
  =?  plus-or-minus-sum  !plus-or-minus-k
    !plus-or-minus-sum
  =.  plus-or-minus-k  !plus-or-minus-k
  inner-loop
::
--
