import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result: String = ""
    for i in numbers {
        if(i == 1 || i == 4 || i == 7) {
            result.append("L")
        }
        
        if(i == 3 || i == 6 || i == 9) {
            result.append("R")
        }
        
        if(i == 2 || i == 5 || i == 8 || i == 0) {
            result.append("T")
        }
    }
    return result
}

//result : "LRLLLRLLRRL"
print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))

//result : "LRLLRRLLLRR"
//print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))

//result : "LLRLLRLLRL"
//print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right"))
