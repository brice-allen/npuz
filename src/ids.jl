"""
    depthlimitedsearch(depth, goal, puzzle)
    Perform a depth-limited search of a tree structure initiated 
    with `puzzle`. Search proceeds until either the `goal` 
    state is found, or no solution is possible.
    
    Return: TreeNode containing the goal state or nothing.
"""
function dls(depth, goal, puzzle)
    frontier = [newtree(puzzle)];

    while !isempty(frontier)
        @timeit to "pop" node = pop!(frontier);

        if node.state == goal
            return node
        end

        # Use pathcost as depth
        if node.pathcost > depth
            continue;
        
        elseif !iscycle(node, 3)
            @timeit to "Number of Moves" acts = allmoves(node.state);
            @timeit to "Expand" res = expand(node.state);

            for (a, r) in zip(acts, res)
                @timeit to "Nodes Created" newnode = addnode(a, node, r);
                @timeit to "Push" push!(frontier, newnode);
            end
        end
    end

    return nothing
end


"""
    iterativedfs(goal, puzzle; initdepth=1, limit=100, step=1)
    Perform a depth-limited search of a tree structure initiated 
    with `puzzle`. Search proceeds until either the `goal` 
    state is found, or no solution is possible.
    
    Return: TreeNode containing the goal state or nothing.
"""
function idfs(goal, puzzle; initdepth=1, limit=100, step=1)
    reset_timer!(to::TimerOutput)
    searchrange = initdepth:step:limit;
    for d in searchrange
            @timeit to "Depth Limited Search" solnode = dls(d, goal, puzzle)

        if !isnothing(solnode)
            printsolve(solnode)
            return solnode
        end
    end
    
    println("No solutions found within depth limit. (limit=$limit)")
    return nothing    
end