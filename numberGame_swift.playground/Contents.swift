import Foundation

//다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.
//1478 → "one4seveneight"
//234567 → "23four5six7"
//10203 → "1zerotwozero3"
//이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.

func solution(_ s:String) -> Int {
    var result: String = s
    let numString: [String:String] = ["0":"zero", "1":"one", "2":"two", "3":"three", "4":"four", "5":"five", "6":"six", "7":"seven", "8":"eight", "9":"nine"]
    
    for (key, value) in numString.sorted(by: { $0 < $1 }) {
        if let rangeText = result.range(of: value) {
            let startWord = result[rangeText].startIndex
            let endWord = result[rangeText].endIndex
            let w1 = result[startWord ..< endWord]
            
            result = result.replacingOccurrences(of: String(w1), with: key)
        }
    }
    
    return Int(result) ?? 0
}

// result : 1478
print(solution("one4seveneight"))

// result : 234567
//print(solution("23four5six7"))

// result : 234567
//print(solution("2three45sixseven"))

// result : 123
//print(solution("123"))
