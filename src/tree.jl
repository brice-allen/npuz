struct TreeNode
    action::Union{Tuple,Nothing}
    parent::Union{TreeNode,Nothing}
    pathcost::Integer
    state::Matrix
end


import Base.==
function ==(x::TreeNode, y::TreeNode)
    x.state == y.state
end

function newnode(action, parent, state)
    cost = parent.pathcost + 1
    newnode = TreeNode(action, parent, cost, state)
    return newnode
end


function createtree(state)
    newnode = TreeNode(nothing, nothing, 0, state)
    return newnode
end



function cyclechecker(node, cynum)
    count = 0
    previous = node

    while (count < cynum) && !isnothing(previous.parent)
        count += 1
        previous = previous.parent

        if node.state == prnt.state
            return true
        end
    end
    return false
end


function displaysolution(solvenode)
    while !isnothing(solvenode)
        println("Step $(solvenode.pathcost):")
        println("\t$(solvenode.state[1,:])")
        println("\t$(solvenode.state[2,:])")
        println("\t$(solvenode.state[3,:])")
        println("\tAction: $(solvenode.action)")
        solvenode = solvenode.parent
    end
    print(to)
end
