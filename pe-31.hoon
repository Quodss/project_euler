::  To find a number of coin sums for a certain sum that contain no coins bigger than a certain coin,
::  subtract lesser coin from the given sum, then apply this algorithm to the new sum and with no coin
::  bigger than the coin subtracted. Repeat for each lesser coin, and add all coin sums up.
::
=<
::
(number-coin-combinations 200 200)
::
|%
++  coins  ^-  (list @)  ~[1 2 5 10 20 50 100 200]
++  number-coin-combinations
|=  [n=@ max-coin=@]
~+  ::  cache computations to avoid overhead
^-  @
?:  |(=(n 0) =(n 1))
  1
=|  coin-index=@
=|  combinations=@
|-  ^-  @
?:  ?|  =(coin-index (lent coins))  ::  ran out of coin denominations...
        (gth (snag coin-index coins) (min n max-coin))  ::  or new coin exceeds the sum or max-coin
    ==
  combinations
=.  combinations  %+  add
                    combinations
                  %=  ^$
                    n  (sub n (snag coin-index coins))
                    max-coin  (snag coin-index coins)
                  ==
$(coin-index +(coin-index))
::
--
