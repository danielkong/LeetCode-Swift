// Palindrome

private func palindrome(_ str: String) -> Bool {
    let chars = Array(str.characters)

    var i = 0
    var j = str.characters.count - 1

    while i < j {

//        if str.subscript(str.index(str.startIndex, offsetBy: i)) == str.subscript(str.index(str.startIndex, offsetBy: j)) {
        if !((chars[i] >= "a" && chars[i] <= "z") || (chars[i] >= "A" && chars[i] <= "Z")) {
            i += 1
        }
        if !((chars[j] >= "a" && chars[j] <= "z") || (chars[j] >= "A" && chars[j] <= "Z")) {
            j -= 1
        }
        if chars[i] == chars[j] {
            i += 1
            j -= 1
        } else {
            return false
        }
    }

    return true
}
