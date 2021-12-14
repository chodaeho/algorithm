import Foundation

//1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
//2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
//3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
//4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
//5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
//6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
//     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
//7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.


func solution(_ new_id:String) -> String {
    var nickname: String = ""
    
//    1 단계, 2단계
    nickname = new_id.lowercased().components(separatedBy: ["~","!","@","#","$","%","^","&","*","(",")","=","+","[","{","]","}",":","?",",","<",">","/"]).joined()
    
//    3 단계
    var comma: [Int] = []
    for (index,text) in nickname.enumerated() {
        if(index != 0) {
            let strIndex = nickname.index(nickname.startIndex, offsetBy: index - 1)
            
            if(nickname[strIndex] == "." && text == ".") {
                comma.append(index)
            }
        }
    }
    for i in comma.sorted(by: {$0 > $1}) {
        let removeComma = nickname.index(nickname.startIndex, offsetBy: i)
        nickname.remove(at: removeComma)
    }
    
//    4단계
    nickname = startEnd(textParam: nickname)
    
//    5단계
    if nickname == "" {
        nickname = "a"
    }
    
//    6단계
    if nickname.count > 15 {
        let removeLength = nickname.index(nickname.startIndex, offsetBy: 14)
        nickname = String(nickname[...removeLength])
    }

//    4단계
    nickname = startEnd(textParam: nickname)
    
//    7단계
    while nickname.count <= 2 {
        let appendText = nickname.index(nickname.startIndex, offsetBy: nickname.count - 1)
        nickname.append(nickname[appendText])
    }
    
    return nickname
}

//    4단계 function
func startEnd(textParam: String) -> String {
    var text = textParam
    
    let end = text.index(text.startIndex, offsetBy: text.count - 1)
    if(text[end] == ".") {
        text.remove(at: end)
    }
    if(text != "") {
        let start = text.index(text.startIndex, offsetBy: 0)
        if(text[start] == ".") {
            text.remove(at: start)
        }
    }
    return text
}
 
 
//result : bat.y.abcdefghi
//print(solution("...!@BaT#*..y.abcdefghijklm"))

//result : z--
//print(solution("z-+.^."))

//result : aaa
//print(solution("=.="))

//result : 123_.def
//print(solution("123_.def"))

//result : abcdefghijklmn
//print(solution("abcdefghijklmn.p"))
