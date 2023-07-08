=<
::
=/  sum=@  :(add 1 3 5 7 9)
=/  n=@  11
|-
^-  @
?:  (gte n 1.000.000)
  sum
=?  sum  (is-palindromic-both n)
  (add sum n)
$(n (add n 2))
::
|%
::  ++is-palindromic-both: checks if a number is palindromic in bases 10 and 2
::
++  is-palindromic-both
  |=  n=@
  ^-  ?
  =/  tape-n-10=tape  (skip (scow %ud n) is-dot)
  =/  tape-n-2=tape  (slag 2 (skip (scow %ub n) is-dot))
  ?&  =(tape-n-10 (flop tape-n-10))
      =(tape-n-2 (flop tape-n-2))
  ==
::  ++is-dot: is cord equal to '.'?
++  is-dot
  |=(cord =(+< '.'))
--
