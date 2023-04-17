
rate(1,test).
parametr(1,param,10).
rate_parametr(1,1,100).


parametr(

id(Yid),
name(Pname),
resolvename(Rname)
).


rate(
id(Xid),
name(Ratename)
).


rparametr(
idrate(Rateid),
idparametr(Paramid),
value(Val)
).


rate(Xid, Ratename):- rparametr(Xid,Yid,_),parametr(Yid,_,_).

 21 have_rate(R,P, V):- сравнить(10,V,P), rparametr(idrate(R),idparametr(P),_), write("OK").
