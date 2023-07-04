=/  weekday=@  1  ::  ~1901.1.1 is Tuesday; 0-indexed
=/  month=@  0  ::  january; 0-indexed
=/  year=@  1.901
=/  sundays=@  0
|-
^-  @
?:  =(year 2.001)
  sundays
?:  =(month 12)
  $(month 0, year +(year))
=/  days-in-month  ^-  @
                   ?.  =(month 1)  ::  is not February?
                     (snag month moh:yo)  ::  yo is a standart Hoon library for date constants
                   ?:  (yelp year)  ::  is leap?
                     29
                   28
=.  weekday  (~(sum fo 7) weekday days-in-month)  ::  modulo arithmetic
=?  sundays  =(weekday 6)
  +(sundays)
$(month +(month))
