% BASE DE CONHECIMENTO: Banco de Dados
% Fatos e Regras
% Tipos de informação: variáveis, atomos, inteiros,
% floats e listas
% variáveis: eles sempre iniciam co uma letra maiúscula
% átomos: sempre iniciam com uma letra minúscula

% funtor(aridade)
% aridade é a quantidade de argumentos do funtor
:- dynamic homem/1.
:- dynamic mulher/1.
homem(goku).
homem(gohan).
homem(goten).
homem(vegeta).
homem(trunks).
mulher(chichi).
mulher(bulma).
mulher(pam).
mulher(videl).
mulher(bra).

% :- implicação (if)
% , AND (e)
% ; OR (ou)
start :- write('Digite seu nome:'),nl,
    read(N),nl,
    write(N).

:- dynamic genitor/2.
genitor(goku, gohan).
genitor(goku, goten).
genitor(chichi, gohan).
genitor(chichi, goten).
genitor(gohan, pam).
genitor(videl, pam).
genitor(vegeta, trunks).
genitor(vegeta, bra).
genitor(bulma, trunks).
genitor(bulma, bra).

%  >  <  >= =<  \=  =:=  \+

mae(M, F) :- genitor(M, F), mulher(M).

pai(P, F) :- genitor(P, F),  homem(P).

avos(V, N) :- genitor(V, X), genitor(X, N).

irmao(I, J) :- genitor(X, I), genitor(X, J), homem(I).

irma(I, J) :- genitor(X, I), genitor(X ,J), mulher(I).

% Manipular a base de conhecimento
% assert : insere um fato ao final da lista de fatos
% asserta : insere um fato no início da lista de fatos

% retract : remove o primeiro fato que satisfazer a consulta
% retractall : remove todos os fatos que satisfazerem a consulta

/*
assert(homem(satan)),
asserta(genitor(satan, videl)),
listing(genitor/2),
avos(satan, pam).
*/

/*
retract(genitor(goku, gohan)),
assert(homem(piccolo)),
assert(genitor(piccolo, gohan)),
pai(X, gohan).
*/

descendente(X, Z) :- genitor(Z, X).
descendente(X, Z) :- genitor(Y, X), descendente(Y,Z).

/* ARITMÉTICA
Operadores matemáticos: +, -, *, /, //, mod
Operadores Lógicos:
	AND (E)
	OR (OU)
Operadores Relacionais:
  	> maior
  	< menor
  	>= maior ou igual
  	<= menor ou igual 
  	=:= igual
  	=\= diferente
  	= unifica
Atribuição:
	is(atribui a)
*/

soma(X, Y, S) :- S is X + Y.
     
aluno(adriano, 8.5).
aluno(bruna, 9.7).
aluno(carlos, 4).
aluno(denise, 6.7).
     
% 0-5.9 R, 6-6.9 C, 7-8.9 B, 9-10 A
indice_aprovacao(NOME) :- 
    aluno(NOME, NOTA),
    (   
    	(NOTA < 6, write('R'));
    	(NOTA >= 6, NOTA < 7, write('C'));
    	(NOTA >= 7, NOTA < 9, write('B'));
    	(NOTA >= 9, write('A'))
    ).
    
% if ( aluno AND (() OR () OR () OR ()) )

% 6h-11h bom dia, 12-17 boa tarde, 18-23 boa noite, 0-5 boa madrugada

saudacao(H) :-
    (   
    	(H >= 6, H =< 11, write('bom dia'));
    	(H >= 12, H =< 17, write('boa tarde'));
    	(H >= 18, H =< 23, write('boa noite'));
    	(H >= 0, H =< 5, write('boa madrugada'))
    ).

     
     