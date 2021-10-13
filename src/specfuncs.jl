function directindex(direction) 
    dirdict = Dict(
        "UP" => (-1, 0), "DOWN" => (1, 0),
        "LEFT" => (0, -1), "RIGHT" => (0, 1)
    );

    return CartesianIndex(dirdict[direction])
end


"""
    swaptile!(board, tile1, tile2)
Swap the labels of `tile1` and `tile2` in-place.
"""
function swaptile!(board, tile1, tile2)
    """Swap the labels on the board for
    elements at index t1 and t2.
    """
    tmp = board[tile1];
    board[tile1] = board[tile2];
    board[tile2] = tmp;
end


"""
    possibleactions(board)
Construct an array of valid actions for `board`
with respect to the tiles being moved (rather 
than the blank space).
Return: Array of actions
"""
function possibleactions(board)
    zeroindex = findfirst(iszero, board);
    # Dict to change perspective of action
    # to the tile being moved.
    invmovedict = Dict(
        "UP" => "DOWN", "DOWN" => "UP",
        "LEFT" => "RIGHT", "RIGHT" => "LEFT"
    );

    possacts = [];
    for direction in ("UP", "DOWN", "LEFT", "RIGHT")
        modindex = zeroindex + directindex(direction)

        if checkbounds(Bool, board, modindex)
            act = (modindex, invmovedict[direction])
            push!(possacts, act);
        end
    end

    return possacts
end


"""
    result(action, board)
Apply `action` to copy of `board` by swapping
tiles. 
Return: Copy of modified board.
"""
function result(action, board)
    """Applies an action to the board.
    The action should be a tuple in the form
    (index, direction) where index is the index 
    of the piece to be moved, and direction is 
    one of "UP", "DOWN", "LEFT", "RIGHT"
    """
    newboard = copy(board);
    index1 = action[1];
    index2 = index1 + directindex(action[2]);
    swaptile!(newboard, index1, index2)

    return newboard
end


"""
    expand(board)
Calculate all possible next-move states.
Return: Array of puzzle states.
"""
function expand(board)
    states = [];
    possacts = possibleactions(board);

    for act in possacts
        push!(states, result(act, board));
    end

    return states
end
