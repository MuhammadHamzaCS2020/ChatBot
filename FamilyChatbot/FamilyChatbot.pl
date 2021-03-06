
   % Muhammad Hamza 1602028
   % Nadeem Abbass Malik 1602008


% Mianbiwi Rula

mianbiwi(chotekhan,chotirani).
mianbiwi(barrekhan,barrirani).
mianbiwi(salim,kausar).
mianbiwi(asad,sumra).
mianbiwi(nadir,nahid).
mianbiwi(rizwan,sanam).
% Parents Rula
parent(chotekhan,kausar).
parent(chotekhan,nadir).
parent(chotekhan,asad).
parent(chotirani,kausar).
parent(chotirani,asad).
parent(chotirani,nadir).

parent(barrekhan,nahid).
parent(barrekhan,sumra).
parent(barrirani,nahid).
parent(barrirani,sumra).


parent(salim,rizwan).
parent(kausar,rizwan).
parent(nadir,burhan).
parent(nadir,rashid).

parent(nadir,akram).
parent(nahid,burhan).
parent(nahid,rashid).
parent(nahid,akram).

parent(asad,salima).
parent(asad,sanam).
parent(sumra,salima).
parent(sumra,sanam).

parent(rizwan,rabia).
parent(sanam,rabia).

% Gins Rula
gins(mard,chotekhan).
gins(mard,salim).
gins(mard,rizwan).

gins(mard,nadir).
gins(mard,asad).
gins(mard,barrekhan).

gins(mard,burhan).
gins(mard,rashid).
gins(mard,akram).

gins(aurat,chotirani).
gins(aurat,barrirani).
gins(aurat,sumra).
gins(aurat,nahid).

gins(aurat,salima).
gins(aurat,sanam).
gins(aurat,rabia).
gins(aurat,kausar).


   % relationship Rula
baap(A,B):- parent(A,B),gins(mard,A).
mother(A,B):- parent(A,B),gins(aurat,A).

beta(X,A):- parent(A,X),gins(mard,X).
beti(X,A):- parent(A,X),gins(aurat,X).

bahu(X,A):- beta(C,A),mianbiwi(C,X).
sala(X,A):- mianbiwi(X,C), brother(C,A).

sali(X,A):- mianbiwi(X,C), sister(C,A).

nani(X,A):- parent(C,A),parent(X,C),gins(aurat,X),gins(aurat,C).

dada(X,A):- parent(C,A),parent(X,C),gins(mard,X),gins(mard,C).
nana(X,A):- parent(C,A),parent(X,C),gins(mard,X),gins(aurat,C).

sussar(X,A):- parent(X,C),gins(mard,X),mianbiwi(C,A).
chachataya(X,A):- baap(C,A),baap(W,C),baap(W,X),gins(mard,X), not(X=A).

brother(X,A):- baap(C,A), baap(C,X), gins(mard,A),  not(X=A).
sister(X,A):- baap(C,A), baap(C,X), gins(aurat,A),  not(X=A).


baapdada(X,A):- baap(X,A).
baapdada(X,A):- baap(X,C), baapdada(C,A).



  % Question That i hardcode in chatbot...
question( [who,is,the,sister,of,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [the,sister,of,X,is],[sister,of,X,is,Y]):-sister(X,Y).
question( [the,sisters,of,X,are],[sister,of,X,is,Y]):-sister(X,Y).
question( [sisters,of,X,are],[sister,of,X,is,Y]):-sister(X,Y).
question( [sisters,of,the,X,are],[sister,of,X,is,Y]):-sister(X,Y).
question( [who,are,the,sisters,of,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [sisters,of,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [sisters,of,the,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [who,is,the,sister,of,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [who,are,the,sisters,of,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [X,has,sisters],[sister,of,X,is,Y]):-sister(X,Y).
question( [who,are,the,sisters,of,X],[sister,of,X,is,Y]):-sister(X,Y).
question( [who,is,the,brother,of,X],[brother,of,X,is,Y]):-brother(X,Y).
question( [who,is,the,father,of,X],[father,of,X,is,Y] ):-baap(X,Y).
question( [who,is,the,mother,of,X],[mother,of,X,is,Y] ):-mother(X,Y).
question(  [who,is,the,son,of,X],[son,of,X,is,Y] ):-beta(Y,X).
question(  [who,is,son,of,X],[son,of,X,is,Y] ):-beta(Y,X).
question(  [the,son,of,X,is],[son,of,X,is,Y] ):-beta(Y,X).
question(  [X,has,sons],[son,of,X,is,Y] ):-beta(Y,X).

question( [who,is,the,daughter,of,X],[daughter,of,X,is,Y] ):-beti(X,Y).
question( [who,is,the,bahu,of,X],[bahu,of,X,is,Y] ):-bahu(X,Y).
question( [who,is,the,nani,of,X],[nani,of,X,is,Y] ):-nani(X,Y).
question( [who,is,the,sussar,of,X],[sussar,of,X,is,Y] ):-sussar(Y,X).
question( [who,is,the,dada,of,X],[dada,of,X,is,Y] ):-dada(X,Y).
question( [who,is,the,nana,of,X],[nana,of,X,is,Y] ):-nana(X,Y).
question( [who,is,the,taya,of,X],[taya,of,X,is,Y] ):-chachataya(X,Y).
question( [who,is,the,chachataya,of,X],[cahchataya,of,X,is,Y] ):-chachataya(X,Y).
question( [who,is,the,chacha,of,X],[chacha,of,X,is,Y] ):-chachataya(X,Y).
question( [who,is,the,sala,of,X],[sala,of,X,is,Y] ):-sala(X,Y).
question( [who,is,sali,of,X],[sali,of,X,is,Y] ):-sali(X,Y).
question( [children,of,X],[X,has,children,Y]):-baap(X,Y).



question( [who,is, X,married,to], [X,is,married,to,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [who,is, X,married,to], [X,is,married,to,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [who,is, X,married,with], [X,is,married,to,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [who,is, X,married,to], [X,is,married,to,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [who,is, X, married,with], [X,is,married,to,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [X,is,married,to], [X,is,married,to,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [wife,of,X,is], [Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [the,wife,of,X,is], [wife,of,X,is,Y]):-mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [who,is,X,married,to], [X,is,married,to,Y]):-	mianbiwi(X,Y) ; mianbiwi(Y,X).
question( [who,are,the,forefathers,of,X],[forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [who,are,the,forefathers,of,X],[forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [tell,me,the,forefathers,of,X],[forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [who,were,the,forefathers,of,X],[forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [the,forefathers,of,X,are],[forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [forefathers,of,X,are], [forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [who,were,the,forefathers,of,X], [forefather,of,X,is,Y] ):-baapdada(Y,X).
question( [forefathers,of,X], [forefather,of,X,is,Y] ):-baapdada(Y,X).





 % Logical Part is start

main:-
    write('Enter the Question (question must close in single brackets)'),
    nl,
    read(Input),
    atomic_list_concat(Con,' ',Input),
    question(Con,Output),
    write(Output).


































