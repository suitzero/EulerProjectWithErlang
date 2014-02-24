%% @author hagyoon
%% @doc @todo Add description to lexico_perm.


-module(lexico_perm).

%% ====================================================================
%% API functions
%% ====================================================================
-export([lexiperm/2]).



%% ====================================================================
%% Internal functions
%% ====================================================================

lexiperm(List,Nth) ->
	io:format("hello ~w.~n",[List]),
	lexiperm([],List,1,Nth).

lexiperm(L,[],1,Nth) ->
	%% io:format("L ~w reach end. ~n",[L]),
	{L,Nth-1};
lexiperm(L,RemainList,Index,Nth) ->
	%% io:format("Index ~w ~w ~n",[Index,RemainList]),
	Removal= lists:nth(Index, RemainList),
	%% io:format("L ~w Removal ~w Remain ~w~n",[L,Removal,RemainList]),
	NewList = lists:append([L,[Removal]]),
	{List,NextTh} = lexiperm(NewList, lists:delete(Removal, RemainList), 1, Nth),
	
	case NextTh of
		0 -> {List,NextTh};
		_ ->
			case Index < length(RemainList) of
				true -> lexiperm(L,RemainList,Index+1,NextTh);
				false -> {List,NextTh}
			end
	end.