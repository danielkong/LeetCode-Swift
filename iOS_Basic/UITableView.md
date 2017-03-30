prepare​For​Reuse or cellForRowAtIndex?

How to improving iPhone UITableView scrolling performance?
    1. Cache the height of the rows (the table view can request this frequently)
    2. Create a least-recently-used cache for the images used in the table (and invalidate all the inactive entries when you receive a memory warning)
    3. Draw everything in the UITableViewCell's drawRect: if possible avoid subviews at all costs (or if you require the standard accessibility functionality, the content view's drawRect:)
    4. Make your UITableViewCell's layer opaque (same goes for the content view if you have one). (not transparent, clipToBounds)
    5. Use the reusableCellIdentifier functionality as recommended by the UITableView examples/documentation
    6. Avoid gradients/complicated graphical effects that aren't pre-baked into UIImages

clipToBounds
self.view1.clipsToBounds = true -- subview get cutoff
self.view2.clipsToBounds = false
Setting this value to YES causes subviews to be clipped to the bounds of the receiver. If set to NO, subviews whose frames extend beyond the visible bounds of the receiver are not clipped. The default value is NO.

