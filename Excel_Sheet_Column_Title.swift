// 168        Excel Sheet Column Title        24.4%        Easy        
/**
Given a positive integer, return its corresponding column title as appear in an Excel sheet.

For example:

    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB 
*/

    func convertToTitle(_ n: Int) -> String {
        if n == 0 { return "" }
        var scalarValue: UInt32 = UInt32((n - 1) % 26)
        for scalar in "A".unicodeScalars {
            scalarValue += UInt32(scalar.value)
        }

        if let ch = Character(UnicodeScalar(scalarValue)!) as? Character { // String(describing: UnicodeScalar(test))
          return convertToTitle((n-1) / 26) + String(ch)
        }
    }
