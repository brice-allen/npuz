"""
    TreeNode(action, parent, pathcost, state)
Node structure for search tree.
"""
struct TreeNode
    action::Union{Tuple, Nothing}
    parent::Union{TreeNode, Nothing}
    pathcost::Integer
    state::Matrix
end


import Base.==
"""
    ==(x, y)
Define equality between Treenodes as 
having equal states.
"""
function ==(x::TreeNode,y::TreeNode)
    x.state==y.state
end


"""
    addnode(action, parent, state)
Create a new TreeNode with pathcost of
the parent plus 1.
Return: TreeNode
"""
function addnode(action, parent, state)
    cost = parent.pathcost + 1;
    newnode = TreeNode(
        action, 
        parent, 
        cost, 
        state
    );

    return newnode
end


"""
    newtree(state)
Create the initial TreeNode for a new search tree.
The node's action and parent are set to `nothing`, 
and the pathcost is set to zero.
Return: TreeNode
"""
function newtree(state)
    newnode = TreeNode(
        nothing,
        nothing,
        0,
        state
    );

    return newnode
end


"""
    iscycle(node, cynum)
Determine whether the search tree has become a cycle
by looking at the `cynum` parents of `node` for an 
equal state.
Returns: Boolean
"""
function iscycle(node, cynum)
    count = 0;
    prnt = node;

    while (count < cynum) && !isnothing(prnt.parent)
        count+=1;
        prnt = prnt.parent;

        if node.state == prnt.state
            return true
        end
    end

    return false
end


"""
    printsolve(solvenode)
Formatted print of a TreeNode and all parents
to the origin.
"""
function printsolve(solvenode)
    while !isnothing(solvenode)
        println("Step $(solvenode.pathcost):")
        println("\t$(solvenode.state[1,:])") 
        println("\t$(solvenode.state[2,:])")
        println("\t$(solvenode.state[3,:])")
        println("\tAction: $(solvenode.action)");
        solvenode = solvenode.parent;
    end
    print(to)
end