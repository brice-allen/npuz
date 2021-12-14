
#  breadth first search   
function bfs(goal, start)
    reset_timer!(to::TimerOutput)
    node = createtree(start)
    if node.state == goal
        return node
    end
    frontier = [node]
    reached = [node.state]
    while !isempty(frontier)
        @timeit to "Moves" acts = moves(node.state)
        @timeit to "Pop" node = popfirst!(frontier)
        @timeit to "Expand" states = expansion(node.state)

        for (currentstate, currentaction) in zip(states, acts)
            if currentstate == goal
                sovle = newnode(currentaction, node, currentstate)
                displaysolution(sovle)
                return sovle
            end
            if !in(currentstate, reached)

                @timeit to "Node Creation" currentnode = newnode(currentaction, node, currentstate)
                @timeit to "Push" push!(frontier, currentnode)
            end
        end
    end

    println("No solutions found!"^10)
    return nothing
end