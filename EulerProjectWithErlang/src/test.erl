%% @author hagyoon
%% @doc @todo Add description to test.


-module(test).

%% ====================================================================
%% API functions
%% ====================================================================
-export([reverse/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================


reverse(L) -> reverse(L, []).
reverse([H|T], L) -> reverse(T, [H|L]);
reverse([], L) -> L.