::  in dojo, first line first, then the rest
::
=text _|=(* ;;(@t +31:+<)) +https://projecteuler.net/resources/documents/0042_words.txt
::
|^
=/  text-tape=tape  (cass (trip text))
=.  text-tape  (skip text-tape |=(=char =(char '"')))
=/  list-words=(list tape)  (split-tape text-tape ',')
=/  list-numbers=(list @)  (turn list-words value-tape)
%-  lent
%+  skim
  list-numbers
is-triangle
::
++  split-tape
  |=  [a=tape separator=char]
  ^-  (list tape)
  =/  index-sep=(unit @)  (find ~[separator] a)
  ?~  index-sep
    ~[a]
  :-  (scag u.index-sep a)
  $(a (slag +(u.index-sep) a))
::
++  value-tape
  |=  a=tape
  ^-  @
  %+  roll
    a
  |=  [=char acc=@]
  ^-  @
  ::  ascii hack
  ::
  (add acc (sub char 96))
::
::  ++is-trangle: n is triangle <=> 2n=k^2 + k for some integer k
::  i.e. isqrt(2n) is equal to remainder of isqrt(2n)
::
++  is-triangle
  |=  n=@
  ^-  ?
  (test (sqt (lsh 0 n)))
::
--
