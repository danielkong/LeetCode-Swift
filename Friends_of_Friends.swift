// Friends of Friends
/**
Friends of Friends. 给一个get_friend_list()的API，要求implement一个function，输入是user，输出是，这个user的所有二度好友，并按共同好友数排序。

链接: https://instant.1point3acres.com/thread/196984
*/

func friendsOfFriends(_ user: User) {
	var dict = [User: Int]()
	let firstFriends = user.get_friend_list()
	for friend in firstFriends {
		for secondFriend in friend.get_friend_list() {
			if !firstFriends.contains(secondFriend) {
				for thirdFriend in secondFriend.get_friend_list() {
					if firstFriends.contains(thirdFriend) {
						if dict[secondFriend] != nil {
							dict[secondFriend] = 1
 						} else {
							dict[secondFriend] += 1
						}
					}
				}
			}
		}
	}
}