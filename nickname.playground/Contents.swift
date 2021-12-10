import Foundation

 

func solution(_ new_id:String) -> String {
    print("newId : \(new_id)")
    var nickname: String = ""

//    1 단계, 2단계

    nickname = new_id.lowercased().components(separatedBy:["~","!","@","#","$","%","^","&","*","(",")","=","+","[","{","]","}",":","?",",","<",">","/"]).joined()

    print("nickname : \(nickname)")
    
    for (index,text) in nickname.enumerated() {
//        var strIndex: String.Index

//        if(index != 0) {

//            strIndex = nickname.index(nickname.startIndex, offsetBy: index - 1)

//        } else {

//            strIndex = nickname.index(nickname.startIndex, offsetBy: index)

//        }

//        let strIndex = nickname.index(nickname.startIndex, offsetBy: index)

//        nickname.remove(at: strIndex)

//        print(nickname[ttt])

        if(index != 0) {
            let strIndex = nickname.index(nickname.startIndex, offsetBy: index)
            if(nickname[strIndex] == "." && text == ".") {
                print("\(nickname[strIndex]), \(text), \(index)")
//                nickname.remove(at: strIndex)
            }
        }
    }

//    let tt: [Int] = [7,2,1]
    
//    for (_, text) in tt.enumerated() {
//        print(text)
//        let i = nickname.index(nickname.startIndex, offsetBy: text)
//        let removed = nickname.remove(at: i)
//        print(removed)
//    }
    return nickname

}


//result : bat.y.abcdefghi
print(solution("...!@BaT#*..y.abcdefghijklm"))

//result : z--
//solution("z-+.^.")

//result : aaa
//solution("=.=")

//result : 123_.def
//solution("123_.def")

//result : abcdefghijklmn
//solution("abcdefghijklmn.p")
