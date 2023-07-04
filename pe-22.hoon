=<
::main part
::  convert @t to tape, trim first and last ", convert to lowercase, split by \",\"
=/  names-cord  .^(@t %cx /===/names/hoon)
=/  names-tape-trimmed=tape  (cass (slag 1 (snip (trip names-cord))))
=/  names-list=(list tape)  (split names-tape-trimmed "\",\"")
=.  names-list  (sort names-list alpha-order)
::  multiply by alphabetical position
=/  names-value-mul-order=(list @)  %-  head
                                    %^  spin  (turn names-list alpha-value)
                                      1
                                    |=([elem=@ state=@] [(mul elem state) +(state)])
(roll names-value-mul-order add)
::
::  core with functions
|%
++  alpha-value
  |=  wrd=tape
  ^-  @
  %+  roll
    (turn wrd (cork @t (curr sub 96)))  ::  ascii hack
  add
::
++  alpha-order
  |=  [a=tape b=tape]
  ^-  flag
  ?~  b
    ?~(a %.y %.n)
  ?~  a
    %.y
  ?.  =(i.a i.b)
    (lth i.a i.b)  ::  ascii hack
  $(a t.a, b t.b)
::
++  split
  |=  [text=tape divider=tape]
  ^-  (list tape)
  ?:  =(text ~)
    ~
  =/  found=(unit @)  (find divider text)
  ?~  found
    ~[text]
  :-  (scag u.found text)
  %=  $
    text  %+  slag
            (add u.found (lent divider))
          text
  ==
--
