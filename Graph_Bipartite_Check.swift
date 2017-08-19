// Graph Bipartite Check
//
/**
input friends relations{{1,2}, {2,3}, {3,4}}
把人分成两拨，每拨人互相不认识，
所以应该是group1{1,3}, group2{2,4}

http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=216431
http://www.geeksforgeeks.org/bipartite-graph/

Given a list of user pairs, return whether or not it's possible all the pairs are of opposite gender.
E.g. oppositeGender([(A, B), (A, C), (E, F), (A, C)]) should return false because if (A, B) is of opposite gender, (B, C) is of opposite gender, then (A, C) can NOT of opposite gender.
*/

// Solution: 
    var dict = Dictionary<Int, Int>()
    var dict2 = [Int: Int]()

func isBipartite(_ relations: [[Int]]) {
	var dict = [String: Int]()
	for relateion in relations {
		if dict[relation[0]] == nil {
			dict[relation[0]] = 0
		}
		if dict[relation[1]] == nil {
			dict[relation[1]] = 1
		}
	}
}
