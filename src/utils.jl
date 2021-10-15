function cartesianmove(direction) 
    dirdict = Dict(
        "UP" => (-1, 0), "DOWN" => (1, 0),
        "LEFT" => (0, -1), "RIGHT" => (0, 1)
    );

    return CartesianIndex(dirdict[direction])
end


"""
 exchange tile1 and tile2 inplace
 the '!' identifies a function that 
    modifies its argument in julia
"""
function tileexchange!(board, tile1, tile2)
    tmp = board[tile1];
    board[tile1] = board[tile2];
    board[tile2] = tmp;
end


"""
    build an array of allowed directions
Return: Array of viable directional moves
"""
function allmoves(board)
    indexzero = findfirst(iszero, board);
    # Dict to change perspective of action
    # to the tile being moved.
    movedict = Dict(
        "UP" => "DOWN", "DOWN" => "UP",
        "LEFT" => "RIGHT", "RIGHT" => "LEFT"
    );

    directions = [];
    for i in ("UP", "DOWN", "LEFT", "RIGHT")
        index = indexzero + cartesianmove(i)

        if checkbounds(Bool, board, index)
            action = (index, movedict[i])
            push!(directions, action);
        end
    end

    return directions
end


"""
    result(action, board)
Apply `action` to copy of `board` by swapping
tiles. 
Return: Copy of modified board.
"""
function nextboard(action, board)
    """Applies an action to the board.
    The action should be a tuple in the form
    (index, direction) where index is the index 
    of the piece to be moved, and direction is 
    one of "UP", "DOWN", "LEFT", "RIGHT"
    """
    newboard = copy(board);
    index1 = action[1];
    index2 = index1 + cartesianmove(action[2]);
    tileexchange!(newboard, index1, index2)

    return newboard
end


"""
    expand(board)
Calculate all possible next-move states.
Return: Array of puzzle states.
"""
function expand(board)
    states = [];
    possacts = allmoves(board);

    for act in possacts
        push!(states, nextboard(act, board));
    end

    return states
end
