import JSON
import RecursiveArrayTools
global filename = "../json/1-move.json"
function buildapuzzle(filename)
    try
        file = JSON.parsefile(filename)
        _start = VectorOfArray(file["start"])
        global start = convert(Array, _start)
        println("Start: $start")
        _goal = VectorOfArray(file["goal"])
        global goal = convert(Array, _goal)
        println("Goal: $goal")
        global n = file["n"]
        println("n: $n")
    catch e
        println("ERROR: Faulty JSON, try again.")
        return
    end
end

