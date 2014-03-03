%% @author hagyoon
%% @doc @todo Add description to num29.


-module(num29).

%% ====================================================================
%% API functions
%% ====================================================================
-export([distinctpowers/2]).



%% ====================================================================
%% Internal functions
%% ====================================================================


distinctpowers(MaxA,MaxB)->length(distinctpowers(2,MaxA,MaxB)).
 
distinctpowers(A,MaxA,MaxB) when A =< MaxA ->
	List = lists:append(distinctpowers(A,2,MaxA,MaxB),distinctpowers(A+1,MaxA,MaxB)),
    lists:usort(List);

distinctpowers(A,MaxA,MaxB) -> []. 

distinctpowers(A,B,MaxA,MaxB) when A =< MaxA andalso B =< MaxB -> [math:pow(A, B)|distinctpowers(A,B+1,MaxA,MaxB)];
distinctpowers(A,B,MaxA,MaxB) -> [].