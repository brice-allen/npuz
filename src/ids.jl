# depth limited
function dls(depth, goal, start)
    frontier = [createtree(start)];

    while !isempty(frontier)
        @timeit to "pop" node = pop!(frontier);

        if node.state == goal
            return node
        end
        if node.pathcost > depth
            continue;
        
        elseif !iscycle(node, 3)
            @timeit to "Moves" acts = moves(node.state);
            @timeit to "Expand" res = expansion(node.state);
            for (action, parent) in zip(acts, res)
                @timeit to "Node Creation" newnode = addnode(action, node, parent);
                @timeit to "Push" push!(frontier, newnode);
            end
        end
    end

    return nothing
end

# iterative
function idfs(goal, start; initdepth=1, limit=100, step=1)
    reset_timer!(to::TimerOutput)
    searchrange = initdepth:step:limit;
    for d in searchrange
            @timeit to "DLS" solnode = dls(d, goal, start)
        if !isnothing(solnode)
            displaysolution(solnode)
            return solnode
        end
    end
    
    println("We have gone too deep, no solutions found!  (limit=$limit)")
    return nothing    
end

