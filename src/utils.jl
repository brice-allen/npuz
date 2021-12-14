function cartesianmoveindex(direction)
    directiondict = Dict("UP" => (-1, 0), "DOWN" => (1, 0), "LEFT" => (0, -1), "RIGHT" => (0, 1))

    return CartesianIndex(directiondict[direction])
end


function swaptiles!(board, x, y)
    temp = board[x]
    board[x] = board[y]
    board[y] = temp
end


function moves(board)
    first = findfirst(iszero, board)
    movedict = Dict("UP" => "DOWN", "DOWN" => "UP", "LEFT" => "RIGHT", "RIGHT" => "LEFT")

    directions = []
    for i in ("UP", "DOWN", "LEFT", "RIGHT")
        index = first + cartesianmoveindex(i)

        if checkbounds(Bool, board, index)
            action = (index, movedict[i])
            push!(directions, action)
        end
    end

    return directions
end


function copyboard(action, board)
    newboard = copy(board)
    index1 = action[1]
    index2 = index1 + cartesianmoveindex(action[2])
    swaptiles!(newboard, index1, index2)

    return newboard
end

## determine all options for move states
function expansion(board)
    states = []
    possacts = moves(board)

    for act in possacts
        push!(states, copyboard(act, board))
    end

    return states
end
