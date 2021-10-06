/**
Snap interview:

 input: (hi hello (bye))
output:
 (
   hi
   hello
   (
     bye
   )
 )

 */

let input = "(hi hello (bye))"
let output = formating(str: input)
print(output)

public func formating(str: String) -> String {
    var level = 0
    var starter = 0
    let array = Array(str)
    var temp = ""
    var res = ""
    var needsSpacingForCurrentLevel = false

    while starter < str.count {
        if array[starter] == "(" {
            temp.append(addSpacing(level))
            temp.append("(\n")
            res.append(temp)
            level += 1

            reset(&temp, needsSpacing: &needsSpacingForCurrentLevel)

        } else if array[starter] == ")" {
            temp.append("\n")
            level -= 1

            temp.append(addSpacing(level))
            temp.append(")")
            res.append(temp)
            
            reset(&temp, needsSpacing: &needsSpacingForCurrentLevel)

            
        } else if array[starter] != " " {
            if needsSpacingForCurrentLevel {
                temp.append(addSpacing(level))
                needsSpacingForCurrentLevel = false
            }
            temp.append(array[starter])
        } else if array[starter] == " " {
            res.append(temp)
            res.append("\n")
            
            reset(&temp, needsSpacing: &needsSpacingForCurrentLevel)
        }
        starter += 1
    }
    return res
}

func addSpacing(_ level: Int) -> String {
    var temp = ""
    let spacing = "~~~~"

    for _ in 0..<level {
        temp.append(spacing)
    }
    return temp
}

func reset(_ word: inout String, needsSpacing: inout Bool) {
    word = ""
    needsSpacing = true
}
