using DataStructures;

#Heuristic misplaced

function misplaced(goal, state)
    x, y = size(state)
    z = 0
    for i = 1:x
        for j = 1:y
            if goal[i, j] == 0
                continue
            elseif goal[i, j] == state[i, j]
                continue
            else
                z += 1
            end
        end
    end
    return z
end

#Heuristic manhattan

function manhattan(goal, state)
    x, y = size(state)
    z = 0
    for i = 1:x
        for j = 1:y
            if goal[i, j] == 0
                continue
            end
            cord = findfirst(isequal(goal[i, j]), state)
            temp = abs(cord[1] - i)
            temp1 = abs(cord[2] - j)
            z += temp + temp1
        end
    end
    return z
end

#  Perform A* search with heuristic.
function astar(goal, heuristic, start)
    reset_timer!(to::TimerOutput)

    node = createtree(start)
    frontier = PriorityQueue{TreeNode,Integer}()
    frontier[node] = 0
    explored = []

    while !isempty(frontier)
        @timeit to "Moves" acts = moves(node.state)
        @timeit to "Dequeue" node = dequeue!(frontier)
        @timeit to "Push" push!(explored, node.state)
        @timeit to "Expand" states = expansion(node.state)

        for (a, s) in zip(acts, states)
            if in(explored, s)
                continue
            end
            @timeit to "Node Creation" cnode = newnode(a, node, s)
            @timeit to "Heuristic Score" score =
                node.pathcost + heuristic(goal, cnode.state)
            if s == goal
                displaysolution(cnode)
                return cnode
            end
            if !(cnode in keys(frontier))
                frontier[cnode] = score
            elseif frontier[cnode] > score
                frontier[cnode] = score
            end
        end
    end
    println("No solution found!"^10)
    return nothing
end


