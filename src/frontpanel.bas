   10 s=33024:a=s:d=0:tb$="        "
   15 up$="sdfghjkl":dn$="zxcvbnm,"
   20 poke53281,0:poke53280,0:print"{wht}{clr}"
   30 v=peek(a):p=128:l$="":d$=""
   40 fori=1to8
   50 q$="W":if(vandp)=pthenq$="Q"
   60 s$="{CBM-E}":if(dandp)=pthens$="{CBM-R}"
   70 l$=l$+q$:d$=d$+s$:p=p/2
   80 next:print"{home}{red}"tb$;tb$;l$
   85 print"{down}{wht}";tb$;tb$;d$
   90 get k$:ifk$=""goto 90
  100 p=128:od=d
  110 fori=1to8
  120 ifk$=mid$(dn$,i,1)thend=dorp
  130 ifk$=mid$(up$,i,1)thend=dand(255-p)
  140 p=p/2:next
  150 ifd<>odgoto30
  160 ifk$=chr$(13)thenpokea,d
  170 ifk$="="thena=a+1
  180 ifk$="&"thena=s
  185 ifk$="!"thensysa:end
  190 goto30
