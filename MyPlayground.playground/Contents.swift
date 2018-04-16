//: Playground - noun: a place where people can play

import Foundation

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var wordsNum = 0
    var accumLength = 0
    var wordsInOneLine = [String]()
    
    var res = [String]()
    
    for (j, word) in words.enumerated() {
        
        // change line or not
        print(word)
        print(accumLength)
        if maxWidth >= accumLength + word.count {
            
            wordsNum += 1
            accumLength += word.count
            accumLength += 1
            wordsInOneLine.append(word)
            
        } else {
            accumLength = 0
            // handle spacing allocate
            let spacingLength = maxWidth - accumLength + wordsNum*1
            let avgSpacing = (wordsNum - 1) != 0 ? spacingLength/(wordsNum-1) : spacingLength
            var extraCount = (wordsNum - 1) != 0 ? spacingLength%(wordsNum-1) : 0
            
            // add to result
            var temp = ""
            // only one word
            
            print(wordsInOneLine)
            if wordsInOneLine.count == 1 {
                temp.append(wordsInOneLine[0])
                var tempAvgSpacing = avgSpacing
                while tempAvgSpacing > 0 {
                    temp.append(" ")
                    tempAvgSpacing -= 1
                }
            } else {
                if j == words.count-1 {
                    // multiple words
                    for (i, w) in wordsInOneLine.enumerated() {
                        temp.append(w)
                        if i != wordsInOneLine.count - 1 {
                            temp.append(" ")
                        } else {
                            let tempCount = temp.count
                            var test = maxWidth - tempCount
                            while test > 0 {
                                temp.append(" ")
                                test -= 1
                            }
                        }
                    }
                } else {
                    // multiple words
                    for (i, w) in wordsInOneLine.enumerated() {
                        temp.append(w)
                        if i != wordsInOneLine.count-1 {
                            var tempAvgSpacing = avgSpacing
                            while tempAvgSpacing > 0 {
                                temp.append(" ")
                                tempAvgSpacing -= 1
                            }
                            if extraCount > 0 {
                                temp.append(" ")
                                extraCount -= 1
                            }
                        }
                    }
                }
            }
            
            res.append(temp)
            
            if j != words.count-1 {
                wordsNum = 1
                accumLength = word.count
                accumLength += 1
                
                wordsInOneLine.removeAll()
                wordsInOneLine.append(word)
            } else {
                accumLength = 0
            }
            
        }
        
         if j == words.count-1 {

             // handle spacing allocate
             let spacingLength = maxWidth - accumLength + wordsNum*1
             let avgSpacing = (wordsNum - 1) != 0 ? spacingLength/(wordsNum-1) : spacingLength
             var extraCount = (wordsNum - 1) != 0 ? spacingLength%(wordsNum-1) : 0

             // add to result
             var temp = ""
             // only one word
             if wordsInOneLine.count == 1 {
                 temp.append(wordsInOneLine[0])
                 var tempAvgSpacing = avgSpacing
                 while tempAvgSpacing > 0 {
                     temp.append(" ")
                     tempAvgSpacing -= 1
                 }
             } else {
                 // multiple words
                 for (i, w) in wordsInOneLine.enumerated() {
                     temp.append(w)
                     if i != wordsInOneLine.count - 1 {
                         temp.append(" ")
                     } else {
                         let tempCount = temp.count
                         var test = maxWidth - tempCount
                         while test > 0 {
                             temp.append(" ")
                             test -= 1
                         }
                     }
                 }
             }

             res.append(temp)
         }
    }
    
    return res
    
}


let res = fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16)
print(res)
// "This is an example"

//["This    is    an","example   of  text"]
//["This    is    an","example  of text","justification.  "]

