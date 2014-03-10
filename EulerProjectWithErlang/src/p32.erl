%% @author hagyoon
%% @doc @todo Add description to p32.


-module(p32).

%% ====================================================================
%% API functions
%% ====================================================================
-export([p32/0,p32sum/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================

pandigit(List,ListA,0)-> 
	A=lists:nth(1, ListA)*1000+lists:nth(2, ListA)*100+lists:nth(3, ListA)*10+lists:nth(4, ListA),
	B=lists:nth(5, ListA),
	C=A*B,
	case lists:sort(lists:map(fun(A)-> A+48 end,List))==lists:sort(integer_to_list(C)) andalso length(integer_to_list(C)) < 5 of
		true -> [C];
		false -> []
	end;
pandigit(List,ListA,1)->
	A=lists:nth(1, ListA)*10+lists:nth(2, ListA),
	B=lists:nth(3, ListA)*100+lists:nth(4, ListA)*10+lists:nth(5, ListA),
	C=A*B,
	case lists:sort(lists:map(fun(A)-> A+48 end,List))==lists:sort(integer_to_list(C)) andalso length(integer_to_list(C)) < 5 of
		true -> [C];
		false -> []
	end.
pandigit(List,ListA) when length(ListA) >= 5
  -> lists:append(pandigit(List,ListA,0),pandigit(List,ListA,1));
pandigit(List,ListA) ->
	Fun = fun(Atom,Sum) -> lists:append(pandigit(lists:delete(Atom, List),lists:append([Atom], ListA)),Sum) end,
	lists:foldl(Fun, [],List).
		
p32() -> lists:usort(pandigit(lists:seq(1,9), [])).
p32sum()-> lists:foldl(fun(A,Sum) -> A+Sum end,0,p32()).