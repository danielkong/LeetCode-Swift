// 165. Compare Version Numbers
/**
Compare two version numbers version1 and version2.
If version1 > version2 return 1, if version1 < version2 return -1, otherwise return 0.

You may assume that the version strings are non-empty and contain only digits and the . character.
The . character does not represent a decimal point and is used to separate number sequences.
For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.

Here is an example of version numbers ordering:

0.1 < 1.1 < 1.2 < 13.37
*/

func compareVersion(_ version1: String, _ version2: String) -> Int {
	var v1 = version1.components(separatedBy: ".")
	var v2 = version2.components(separatedBy: ".")

	var res = 0
	for i in 0 ..< max(v1.count, v2.count) {
		let left: Int! = i < v1.count ? Int(v1[i]) : 0
		let right: Int! = i < v2.count ? Int(v2[i]) : 0
		if left == right  {
			res = 0
		} else if left > right {
			return 1
		} else if left < right {
			return -1
		}
	}
	return res
}
