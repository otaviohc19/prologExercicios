/*
 * Problema do jantar
 * Num fim de semana chuvoso (sexta, sábado e domingo),
 * três mulheres tiveram a mesma ideia: fazer uma sopa
 * para o jantar da família. As sopas foram de agrião,
 * cebola e ervilha. Uma das mulheres se chama Nádia.
 * Conforme as informações a seguir, descubra seus nomes,
 * em que dia da semana cada uma fez a sopa e que tipos de sopa preparou
 * para o jantar.
 * 1. Ana Lúcia fez a sopa de ervilha.
 * 2. A sopa de cebola foi preparada para o jantar de domingo.
 * 3. Dalva resolveu fazer sopa na sexta-feira.
 * 
 *  Nádia - cebola- domingo
 *	Ana Lúcia - Ervilha - sabado
 *  Dalva - agrião - sexta
 * 
 * jantar(
 * 		mulher(N1, D1, S1),
 * 		mulher(N2, D2, S2),
 * 		mulher(N3, D3, S3)
 * )
 * 
 * mulher(NOME, DIA, SOPA)
 * */

nome( mulher(N, _, _), N).
dia( mulher(_, D, _), D).
sopa( mulher(_, _, S), S).

membro(M, jantar(M, _, _)).
membro(M, jantar(_, M, _)).
membro(M, jantar(_, _, M)).

resposta(
	jantar(
       mulher(_, sexta, _),		
       mulher(_, sabado, _),		
       mulher(_, domingo, _)
	)
).


solucao_jantar(Sol) :-
    resposta(Sol),
    membro(X, Sol),			% criei uma mulher e a chamei de X
    nome(X, ana_lucia),		% X se chama ana_lucia
    sopa(X, ervilha),		% X fez sopa de ervilha
	
    membro(Y, Sol),
    sopa(Y, cebola),
    dia(Y, domingo),
    
    membro(Z, Sol),
    nome(Z, dalva),
    dia(Z, sexta),
    
    membro(A, Sol),
    sopa(A, agriao),
    
    membro(B, Sol),
    nome(B, nadia),
    
    membro(C, Sol),
    dia(C, sabado).
    