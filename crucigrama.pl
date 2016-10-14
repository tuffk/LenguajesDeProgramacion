palabra(camion,c,a,m,i,o,n).
palabra(mango,m,a,n,g,o,_).
palabra(media,m,e,d,i,a,_).
palabra(cama,c,a,m,a,_,_).
palabra(mesa,m,e,s,a,_,_).
palabra(mora,m,o,r,a,_,_).

crossword(H1,H2,V1,V2,V3,V4) :- palabra(H1,_,H12,_,H14,_,H16),
                                palabra(H2,_,H22,_,H24,_,_),
                                palabra(V1,_,H12,_,_,_,_),
                                palabra(V2,_,_,_,H14,_,_),
                                palabra(V3,_,_,H16,_,H22,_),
                                palabra(V4,_,_,_,H24,_,_),
                                H1\=H2,
                                H1\=V1, H1\=V2, H1\=V3, H1\=V4,
                                H2\=V1, H2\=V2, H2\=V3, H2\=V4,
                                V1\=V2, V1\=V3, V1\=V4,
                                V2\=V3, V2\=V4,
                                V3\=V4.


