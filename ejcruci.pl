% astante  astoria  baratto  cobalto  pistola  statale

word(astante,a,s,t,a,n,t,e).
word(astoria,a,s,t,o,r,i,a).
word(baratto,b,a,r,a,t,t,o).
word(cobalto,c,o,b,a,l,t,o).
word(pistola,p,i,s,t,o,l,a).
word(statale,s,t,a,t,a,l,e).

cruci(H1,H2,H3,V1,V2,V3) :- word(H1,_,H12,_,H14,_,H16,_),
							word(H2,_,H22,_,H24,_,H26,_),
							word(H3,_,H32,_,H34,_,H36,_),
							word(V1,_,H12,_,H22,_,H32,_),
							word(V2,_,H14,_,H24,_,H34,_),
							word(V3,_,H16,_,H26,_,H36,_),
							H1\=H2,H1\=H3,H1\=V1,H1\=V2,H1\=V3,
							H2\=H3,H2\=V1,H2\=V2,H2\=V3,
							H3\=V1,H3\=V2,H3\=V3,
							V1\=V2,V1\=V3,
							V2\=V3.