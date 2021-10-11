"""
    getpuzzle8(puznum::Integer)

Return an 8-puzzle puzzle based on its id number.
"""
function getpuzzle8(puznum::Integer)
    puzzleg = Matrix{Int}([0 1 2; 3 4 5; 6 7 8]);
    puzzle0 = Matrix{Int}([3 1 2; 7 0 5; 4 6 8]);
    puzzle1 = Matrix{Int}([7 2 4; 5 0 6; 8 3 1]);
    puzzle2 = Matrix{Int}([6 7 3; 1 5 2; 4 0 8]);
    puzzle3 = Matrix{Int}([0 8 6; 4 1 3; 7 2 5]);
    puzzle4 = Matrix{Int}([7 3 4; 2 5 1; 6 8 0]);
    puzzle5 = Matrix{Int}([1 3 8; 4 7 5; 6 0 2]);
    puzzle6 = Matrix{Int}([8 7 6; 5 4 3; 2 1 0]);
    
    numdict = Dict(
        -1 => puzzleg, 0 => puzzle0, 
        1 => puzzle1, 2 => puzzle2, 
        3 => puzzle3, 4 => puzzle4,
        5 => puzzle5, 6 => puzzle6
    );

    return copy(get(numdict, puznum, -1))
end


"""
    getpuzzle8(puzname::String)

Return an 8-puzzle based on its name id.
"""
function getpuzzle8(puzname::String)
    namedict = Dict(
        "goal" => -1, "puzzle-0" => 0, 
        "puzzle-1" => 1, "puzzle-2" => 2, 
        "puzzle-3" => 3, "puzzle-4" => 4, 
        "puzzle-5" => 5, "puzzle-6" => 6
    );

    numid = get(namedict, puzname, -1);
    return getpuzzle8(numid)
end


"""
    getpuzzle15(puznum::Integer)

Return a 15-puzzle puzzle based on its id number.
"""
function getpuzzle15(puznum::Integer)
    """Return 15-puzzle based on number id."""
    puzzleg = Matrix{Int}([0 1 2 3; 4 5 6 7; 8 9 10 11; 12 13 14 15]);
    puzzle1 = Matrix{Int}([13 10 11 6; 5 7 4 8; 1 12 14 9; 3 15 2 0]);
    puzzle2 = Matrix{Int}([13 10 11 6; 5 7 4 8; 2 12 14 9; 3 15 1 0]);

    numdict = Dict(-1 => puzzleg, 1 => puzzle1, 2 => puzzle2);

    return copy(get(numdict, puznum, -1))
end


"""
    getpuzzle15(puzname::String)

Return a 15-puzzle based on its name id.
"""
function getpuzzle15(puzname::String)
    namedict = Dict("goal" => -1, "puzzle-1" => 1, "puzzle-2" => 2);

    numid = get(namedict, puzname, -1);
    return getpuzzle15(numid)
end
