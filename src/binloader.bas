   10 s=33024:a=s
   20 input g$
   30 if g$="x" then sys s:end
   35 v=0:p=128
   40 fori=1to8
   45 if mid$(g$,i,1)="1"then v=v or p
   50 p=p/2
   55 next
   60 poke a,v
   70 a=a+1
   80 goto 20
