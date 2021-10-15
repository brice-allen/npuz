"""
    bfs(goal, puzzle)
    Perform a breadth-first search of a tree structure initiated 
    with `puzzle`. Search proceeds  until either the `goal` 
    state is found, or no solution is possible.
    
    Return: TreeNode containing the goal state or nothing.
"""
function bfs(goal, puzzle)
    # Reset timer
    reset_timer!(to::TimerOutput)

    node = newtree(puzzle);

    if node.state == goal
        return node
    end

    frontier = [node];
    reached = [node.state];

    while !isempty(frontier)
        @timeit to "Number of Moves" acts = allmoves(node.state);
        @timeit to "Pop" node = popfirst!(frontier);
        @timeit to "Expand" states = expand(node.state);


        for (cstate, caction) in zip(states, acts)
            if cstate == goal
                solvnode = addnode(caction, node, cstate);
                printsolve(solvnode)
                return solvnode
            end

            if !in(cstate, reached)
                @timeit to "Push" push!(reached, cstate);
                @timeit to "Nodes Created" cnode = addnode(caction, node, cstate);
                @timeit to "Push" push!(frontier, cnode)
            end
        end
    end

    println("No solutions found.")
    return nothing
end