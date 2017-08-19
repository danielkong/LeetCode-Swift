// Iterator with map and filter
// How to use iterator to go through a HashMap?

// Java Solution:
public static void printMap(Map mp) {
  Iterator it = mp.entrySet().iterator();
  while (it.hasNext()) {
	Map.Entry pair = (Map.Entry)it.next();
	System.out.println(pair.getKey() + " = " + pair.getValue());
	it.remove(); // avoids a ConcurrentModificationException
  }
}
