%% @author hagyoon
%% @doc @todo Add description to prime.


-module(prime).

%% ====================================================================
%% API functions
%% ====================================================================
-export([range/2,primes/1,isprime/1,find_quadratic_primes/1,quadratic_primes/3]).



%% ====================================================================
%% Internal functions
%% ====================================================================

range(N, N) -> [N];

range(Min, Max) -> [Min | range(Min+1, Max)].

remove_multiples(N, [H|T]) when H rem N == 0 -> remove_multiples(N, T);

remove_multiples(N, [H|T]) -> [H | remove_multiples(N, T)];
remove_multiples(_, []) -> [].
sieve([H|T]) -> [H | sieve(remove_multiples(H, T))];
sieve([]) -> [].
primes(Max) -> sieve(range(2, Max)).

divisorble(Num,Divisor) when Num rem Divisor == 0 -> false;
divisorble(Num,Divisor) when Num =< Divisor*Divisor -> true;
divisorble(Num,Divisor) when Num > Divisor*Divisor -> divisorble(Num,Divisor+1).

isprime(Num) when Num < 2 -> false;
isprime(2) -> true;
isprime(Num) ->
	divisorble(Num,2).

foreach(F,[])->ok;
foreach(F,[H|T])->
	F(H),
	foreach(F,T).

map(F, [H|T]) -> [F(H)|map(F, T)];
map(F, [])    -> [].

find_quadratic_primes(A) when A >= 1000 -> ok;
find_quadratic_primes(A) ->
  	New_List = map(fun(H) -> {quadratic_primes(0,A,H),A,H} end, primes(1000)),
	max(lists:max(New_List),find_quadratic_primes(A+1)).
	

quadratic_primes(N,A,B) ->
	case isprime(N*N+A*N+B) of
		true -> quadratic_primes(N+1,A,B);
		false -> N-1
	end.
