::  draft
::
|^
=/  games-hands=(list [hand hand])
  %+  turn
    games-txt
  ;:  cork
    trip
    ::
    |=  game=tape
    ^-  [hand hand]
    =/  hand-first=tape  (scag 14 game)
    =/  hand-second=tape  (slag 15 game)
    ?>(&(=(14 (lent hand-first)) =(14 (lent hand-second))))
    :-
      :~  (tape-to-card (swag [0 2] hand-first))
          (tape-to-card (swag [3 2] hand-first))
          (tape-to-card (swag [6 2] hand-first))
          (tape-to-card (swag [9 2] hand-first))
          (tape-to-card (swag [12 2] hand-first))
      ==
    :~  (tape-to-card (swag [0 2] hand-second))
        (tape-to-card (swag [3 2] hand-second))
        (tape-to-card (swag [6 2] hand-second))
        (tape-to-card (swag [9 2] hand-second))
        (tape-to-card (swag [12 2] hand-second))
    ==
    ::
  ==
%-  lent
%+  skim
  games-hands
compare-hands
::
::  card type: cell of rank and suite. J=11, Q=12, K=13, A=14
::
+$  rank  @ud
+$  suite  ?(%h %c %d %s)
::
+$  card
  [rank suite]
::
+$  hand
  (list card)
::
++  tape-to-card
  |=  =tape
  ^-  card
  ?>  =(2 (lent tape))
  =/  [rank-char=char suit-char=char]  [(snag 0 tape) (rear tape)]
  =/  =rank
    ?:  &((gte rank-char '2') (lte rank-char '9'))
      (sub rank-char 48)
    ?:  =(rank-char 'T')
      10
    ?:  =(rank-char 'J')
      11
    ?:  =(rank-char 'Q')
      12
    ?:  =(rank-char 'K')
      13
    ?:  =(rank-char 'A')
      14
    !!
  =/  =suit
    ?:  =(suit-char 'H')
      %h
    ?:  =(suit-char 'C')
      %c
    ?:  =(suit-char 'D')
      %d
    ?:  =(suit-char 'S')
      %s
    !!
  [rank suit]
::
++  high-card
  |=  =hand
  ^-  @ud
  %+  roll
    hand
  |=  [[=rank =suit] acc=@ud]
  ^-  @ud
  (max acc rank)
::
++  has-one-pair
  |=  =hand
  ^-  ?

--
