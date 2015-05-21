-module (igp).
-export ( [sum/1, 
           last/1,
           last2/1,
           nth/2,
           nth2/2,
           list_size/1,
           reverseL/1,
           make_flat/1,
           es_palindromo/1, es_palindromo2/1,
           nodups/1,
           packd/1,
           rle/1,
           rled/1] ).

%% http://weblog.hypotheticalabs.com/?page_id=128 %%

%% 0. sum %%

sum ( L )   -> sum ( 0, L ).

sum ( Y, []) -> Y;
sum ( X, [Y|Z] ) -> sum ( X+Y, Z).

%% 1. last %%

last ([Y|L]) -> last (Y,L).

last (_, [Y|L])  -> last (Y,L);
last (Y, []) -> Y.

%% 3. last 2 elements %%

last2 ([X|L]) -> last2([],X,L).
last2 (X,Y,[]) -> [ X, Y ];
last2 (_,Y,[Z|L]) -> last2(Y,Z,L).


%% 3. the nth element %%

nth (L,N) -> nth(L,N,1).
nth ([X|_], N, C) when N=:=C -> X;
nth ([_|L], N, C) when N=/=c -> nth(L,N,C+1);
nth ([], _, _) -> [].

%% 3. the nth element (unguarded version) %%

nth2 (L,N) -> nth2(L,N,1).
nth2 ([X|_], N, N) -> X;
nth2 ([_|L], N, C) -> nth(L,N,C+1);
nth2 ([],_,_) -> [].

%% 4. list size %%

list_size (L) -> list_size (0,L).
list_size (N,[_|L]) -> list_size (N+1,L);
list_size (N,[]) -> N.

%% 5. reverse a list %%

reverseL ([]) ->  [];
   reverseL ([X|L]) ->  reverseL(L)  ++ [ X ].

%% 6. es_palindromo %%
%% forma "cutre" - sin dar la vuelta al palindromo

es_palindromo ( X ) -> es_palindromo (X, reverseL(X)).
   es_palindromo ( X, X) -> true;
   es_palindromo ( _, _) -> false.

%% 6. es_palindromo2 %%
%% dando la vuelta al palindromo

es_palindromo2 ( [X|L] ) -> es_palindromo2 ([X], [], L).
   es_palindromo2 ( X, _, X) -> true;
   es_palindromo2 ( _X, _Y, []) -> false;
   es_palindromo2 ( X, [], [Y|L]) -> es_palindromo2 ( X, Y, L);
   es_palindromo2 ( X, Y, L) -> es_palindromo2 ( [Y] ++ X, [], L).


%% 7. flatten a list %%
%make_flat ([X|L]) when L =/= [] -> [ make_flat (X) ] ++ [ make_flat(L) ];
%make_flat ([X]) -> make_flat(X);
%make_flat (X) -> X.

make_flat([]) -> [];
   make_flat([X|L]) -> make_flat (X) ++ make_flat (L);
   make_flat(X) -> [X].


%% 8. nodups %%
nodups ( [X|L] ) -> nodups (X,L).
nodups (X, [X|L]) -> nodups (X,L);
   nodups (X, [Y|L]) -> [X] ++ nodups (Y,L);
   nodups (X, []) -> [X].


%% 9. packdups %%
%% >igp:packd([a, a, a, b, b, c, d, e, f, f]).
%% [[a, a, a], [b, b], c, d, e, [f, f]]

packd(X) -> X.
%packd([X|L]) -> packd ( X, [], L).
  % pasamos duplicados a acumulado
  %rle(T,X,[])-> [ ( T,X) ].

  % encontramos un duplicado
  %% packd(X,[],[X|L]) -> packd (X,[X,X], L);
  %%% añadimos al acumulado mientras haya duplicados
  % packd(X,A,[Y|L]) -> A ++ [X]  ++ packd ( Y, [], L);
  %% cuando no queda lista
  %packd(X,A,[]) -> A ++ [X].


%% 10. Run lenght encoding of list components %%
rle([X|L]) -> rle(1,X,L).
   rle(T,X,[])-> [ {T,X} ] ;
   rle(T,X,[X|L]) -> rle(T+1,X,L);
   rle(T,X,[Y|L]) -> rle (T,X,[]) ++ rle(1,Y,L).

%% 11. Decode a RLEd list %%

rled([{T,X}|L]) -> rled(T,X) ++ rled (L);
   rled([]) -> [].
   rled(1,X) -> [X];
   rled(T,X) -> [X] ++ rled(T-1,X).
