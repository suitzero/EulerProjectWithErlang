%% @author hagyoon
%% @doc @todo Add description to fibo.


-module(fibo).

%% ====================================================================
%% API functions
%% ====================================================================
-export([fibo_tail/1,find_ndigit_fibo_idx/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================

fibo_tail(2) -> {1,1};

fibo_tail(N) ->
	{Last,Current}=fibo_tail(N-1),
	{Current,Last+Current}.

find_ndigit_fibo_idx(N) ->
	find_ndigit_fibo_idx(N,2).

find_ndigit_fibo_idx(N,Start) ->
	{_,Current}=fibo_tail(Start),
	case length(integer_to_list(Current)) of
		Length when N == Length -> Start;
		Length when N > Length -> find_ndigit_fibo_idx(N,Start+1);
		_ -> -1
	end.
	