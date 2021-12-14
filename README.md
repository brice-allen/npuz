# Program 1 - State Space Search  

Intro to AI CSCI-4202 CU Denver.

## Installation

On the command line enter 'julia' to initialize the Julia REPL. Use the package manager [pkg](https://docs.julialang.org/en/v1/stdlib/Pkg/) by entering ']' to install dependencies. Add the following dependencies. After installing the dependencies enter Ctrl+D to return to the Julia REPL.

- RecursiveArrayTools
- DataStructures
- JSON
- TimerOutputs

```bash
$  julia 
julia>  ]
(@v1.6) pkg> add RecursiveArrayTools
(@v1.6) pkg> add DataStructures
(@v1.6) pkg> add JSON
(@v1.6) pkg> add TimerOutputs
julia>
```

## Usage

```julia
julia> include("init.jl")
## returns expansion ()
julia> buildapuzzle("../json/10-moves.json") ## Change puzzle name as desired
##  returns details of valid puzzles, displays error message if invalid json 
##          Start: Any[3 6 0; 7 4 8; 1 2 5]
##          Goal: Any[0 3 6; 1 4 7; 2 5 8]
##          n: 3
julia> astar(goal,manhattan, start) ## run program
## availible functions are: 
##           function astar(goal, heuristic, start)
##                 - Heuristic = misplaced or manhattan
##           idfs(goal, start; initdepth=1, limit=100, step=1)
##                  - only start and goal are required



```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)