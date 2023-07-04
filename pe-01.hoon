%+  roll
  (gulf 1 999)
|=  [i=@ acc=@]
?:  |(=(0 (mod i 5)) =(0 (mod i 3)))
  (add acc i)
acc
