%% @author hagyoon
%% @doc @todo Add description to spiral.


-module(spiral).

%% ====================================================================
%% API functions
%% ====================================================================
-export([sumofspiral/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================

turn(Direction) -> 
	(Direction+1) rem 4.


direction_change(Step,Max_Step) -> Step == Max_Step.
  
sumofspiral(N,Direction,Step,Max_Step,Spiral_Size) when Step == Spiral_Size andalso Direction == 1 -> 0;
sumofspiral(N,Direction,Step,Max_Step,Spiral_Size) when Direction == 1 andalso Step == Max_Step-1 -> N+sumofspiral(N+1,Direction,Step+1,Max_Step,Spiral_Size); 
sumofspiral(N,Direction,Step,Max_Step,Spiral_Size) when Direction == 1 andalso Step == Max_Step -> sumofspiral(N+1,turn(Direction),1,Max_Step,Spiral_Size);
sumofspiral(N,Direction,Step,Max_Step,Spiral_Size) when (Direction == 0 orelse Direction == 2) andalso Step == Max_Step -> N+sumofspiral(N+1,turn(Direction),1,Max_Step+1,Spiral_Size);
sumofspiral(N,Direction,Step,Max_Step,Spiral_Size) when Step == Max_Step -> N+sumofspiral(N+1,turn(Direction),1,Max_Step,Spiral_Size);
sumofspiral(N,Direction,Step,Max_Step,Spiral_Size) -> sumofspiral(N+1,Direction,Step+1,Max_Step,Spiral_Size).

sumofspiral(Spiral_Size) -> sumofspiral(1,0,0,0,Spiral_Size). 