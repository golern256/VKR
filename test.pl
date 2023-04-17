parametr(
    id(1),
    name("test"),
    resolvename(10)
).

rate(
    id(1),
    name("testrate")
).

rparametr(
    idrate(1),
    idparametr(1),
    value("x")
).

get_value(P,Hv):-
parametr(P,_,_),Hv=resolvename(_),write(Hv).


comparison(V1,V2,P):-
parametr(id(P),_,_), V2>V1.


have_rate(R,P, V):- comparison(10,V,P), rparametr(idrate(R),idparametr(P),_), write("OK").
