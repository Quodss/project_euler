::  Curious nontrivial fraction has to have same digits in its numerator and denominator at different positions.
::
=/  denominator=@  12
=/  numerator=@    11
=/  prod-denom=@  1
=/  prod-numer=@  1
|-
?:  =(denominator 100)
  (div prod-denom d:(egcd prod-denom prod-numer))
?:  |(=(numerator denominator) =(0 (mod denominator 10)))
  $(numerator 11, denominator +(denominator))
?:  =(0 (mod numerator 10))
  $(numerator +(numerator))
=/  numer-cell=[@ @]  [(div numerator 10) (mod numerator 10)]
=/  denom-cell=[@ @]  [(div denominator 10) (mod denominator 10)]
?:  ?&  =(-:numer-cell +:denom-cell)
        =((div denominator d:(egcd numerator denominator)) (div -:denom-cell d:(egcd +:numer-cell -:denom-cell)))
        =((div numerator d:(egcd numerator denominator)) (div +:numer-cell d:(egcd +:numer-cell -:denom-cell)))
    ==
  =.  prod-denom  (mul prod-denom denominator)
  =.  prod-numer  (mul prod-numer numerator)
  $(numerator +(numerator))
?:  ?&  =(+:numer-cell -:denom-cell)
        =((div denominator d:(egcd numerator denominator)) (div +:denom-cell d:(egcd -:numer-cell +:denom-cell)))
        =((div numerator d:(egcd numerator denominator)) (div -:numer-cell d:(egcd -:numer-cell +:denom-cell)))
    ==
  =.  prod-denom  (mul prod-denom denominator)
  =.  prod-numer  (mul prod-numer numerator)
  $(numerator +(numerator))
$(numerator +(numerator))
