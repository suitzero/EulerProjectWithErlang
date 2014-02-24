%% @author hagyoon
%% @doc @todo Add description to reciprocalcycles.


-module(reciprocalcycles).

%% ====================================================================
%% API functions
%% ====================================================================
-export([findcycle_denominator_lessthan/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================

findcycle_denominator_lessthan(1) -> -1;
findcycle_denominator_lessthan(N) -> max(findcycle_denominator_lessthan(N-1),divide_loop(N,1,[])).

index_of(Item, List) -> index_of(Item, List, 1).

index_of(_, [], _)  -> not_found;
index_of(Item, [Item|_], Index) -> Index;
index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).

divide_loop(N,K,ListOfRemainder) ->
	case K*10 rem N == 0 of
		true -> -1;
		false ->
			case K*10 div N of
				Num when Num > 0 ->
					case lists:member(K*10, ListOfRemainder) of
						true -> Rindex = index_of(K*10,ListOfRemainder),
								Result = lists:nthtail(Rindex-1, ListOfRemainder),
								io:format("N:~w L:~w +again ~w len ~w .~n",[N,Result,K*10,length(Result)]),
								length(Result);
						false -> divide_loop(N, K*10 rem N,lists:append(ListOfRemainder,[K*10]))
					end;
				Num when Num == 0 -> 
					case K*10 < N of
						true -> divide_loop(N, K*10,ListOfRemainder);
						false -> -1
					end
			end
	end.

