Swift API Design Guideline

1.
friends.remove(ted)
friends.remove(at: positionOfTed)

2. "ed/ing" rule:
x.reverse() // mutating
let y = x.reversed() // non-mutating

docDirectory.appendPathComponent(".list")	// mutating
let docFile = docDirectory.appendingPathComponent(".list")	// non-mutating

3. objective-C names in swift
	Selector("handleDragWithSender:for:") [X] weak link
	#selector(handleDrag(sender:for:)) [√] more safe
  also could for property getter/setter
   	#selector(setter: Artist.name)

  #keyPath
  	album.addObserver(self, forKeyPath: #keyPath(Album.artist.name), options: .new, context: &artistNameContext)

  extension MyController {
  	@objc(handleDrag:forEvent:)	// name what you want
	func handleDrag(sender: UIControl, for event:UiEvent) { ... }
  }
  // generated Object
  @interface Mycontroller ()
  -(void)handleDragWithSender:(UIControl *)sender for:(UIEvent *)event;
  @end
