=/  add-last-10  ~(sum fo (pow 10 10))
%+  roll
  (gulf 1 1.000)
|=  [i=@ acc=@]
(add-last-10 acc (pow i i))
