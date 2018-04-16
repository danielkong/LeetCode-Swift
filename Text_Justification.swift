// 68. Text Justification
/**
Given an array of words and a length L, format the text such that each line has exactly L characters and is fully (left and right) justified.

You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly L characters.

Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

For the last line of text, it should be left justified and no extra space is inserted between words.

For example,
words: ["This", "is", "an", "example", "of", "text", "justification."]
L: 16.

Return the formatted lines as:

[
   "This    is    an",
   "example  of text",
   "justification.  "
]
 

Note: Each word is guaranteed not to exceed L in length.
*/

/** 
Idea: Two case: 	1. regular line
							check how many words for each line
							transform each line string with spacing issue
					2. Last line
					
 Runtime: O(n)
 Space: O(n)
*/

    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var wordsNum = 0
        var accumLength = 0
        var wordsInOneLine = [String]()

        var res = [String]()

        for (j, word) in words.enumerated() {

            // change line or not
            if maxWidth >= accumLength + word.count {

                wordsNum += 1
                accumLength += word.count
                accumLength += 1
                wordsInOneLine.append(word)

            } else {


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

                res.append(temp)

                wordsNum = 1
                accumLength = word.count
                accumLength += 1

                wordsInOneLine.removeAll()
                wordsInOneLine.append(word)                
            }

            if j == words.count-1 {

                // handle spacing allocate
                let spacingLength = maxWidth - accumLength + wordsNum*1
                let avgSpacing = (wordsNum - 1) != 0 ? spacingLength/(wordsNum-1) : spacingLength

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