import Foundation

//번호가 지워진 로또 번호를 담은 배열 lottos, 당첨 번호를 담은 배열 win_nums가 매개변수로 주어집니다.
//이때, 번호가 지워진 로또의 당첨 가능한 최고 순위와 최저 순위를 차례대로 배열에 담아서 return 하도록 solution 함수를 완성해주세요.
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let info: Array = [6,6,5,4,3,2,1]
    var hitCount: Int = 0
    var zeroCount: Int = 0
    
    for lottoNum in lottos {
        if(lottoNum != 0) {
            for winNum in win_nums {
                if(lottoNum == winNum) {
                    hitCount += 1
                }
            }
        } else {
            hitCount += 1
            zeroCount += 1
        }
    }
    
    return [info[hitCount], info[hitCount - zeroCount]]
}

//예상결과 : [3, 5]
print(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
 
//예상결과 : [1, 6]
//print(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))
 
//예상결과 : [1, 1]
//print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))
