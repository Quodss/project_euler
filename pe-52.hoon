|^
=/  x=@  10
|-  ^-  @
?:  ?&  (same-amount-of-digits x (mul 6 x))
        (is-permutation x (mul 2 x))
        (is-permutation x (mul 3 x))
        (is-permutation x (mul 4 x))
        (is-permutation x (mul 5 x))
        (is-permutation x (mul 6 x))
    ==
  x
$(x +(x))
::
++  same-amount-of-digits
  |=  [a=@ b=@]
  ^-  ?
  ?:  =(a 0)
    =(b 0)
  $(a (div a 10), b (div b 10))
::
++  is-permutation
  |=  [a=@ b=@]
  =/  [a-tape=tape b-tape=tape]  [(a-co:co a) (a-co:co b)]
  ?>  =((lent a-tape) (lent a-tape))
  |-  ^-  ?
  ?~  a-tape
    &
  =/  i-a-index-b=(unit @)  (find ~[i.a-tape] b-tape)
  ?~  i-a-index-b
    |
  $(a-tape t.a-tape, b-tape (oust [u.i-a-index-b 1] b-tape))
::
--
