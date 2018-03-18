# Understanding Auto Layout

https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1

# Auto Layout Without Constraints (UIStackView)
* axis -- vertical horizontal
* distribution :
    - fill (default)
        + A layout where the stack view resizes its arranged views so that they fill the available space along the stack view’s axis. When the arranged views do not fit within the stack view, it shrinks the views according to their compression resistance priority. If the arranged views do not fill the stack view, it stretches the views according to their hugging priority. If there is any ambiguity, the stack view resizes the arranged views based on their index in the arrangedSubviews array.
    - fillEqually
        + arrangeView equal width
    - fillPropertionally
    - equalSpacing
    - equalCentering
* alignment : vertical 
    - fill (default)
    - leading (vertical)
    - top (h)
    - firstBaseline -- based on their first baseline
    - center
    - trailing (v)
    - bottom (h)
    - lastBaseline
* spacing : 
    - strict spacing for `fillPropertionally`
    - min spacing for `equalSpacing` and `equalCentering`

stack view will show intrinsic content size for arrangedSubviews
    - UIView no intrinsic content size
    - Slider define only width
    - Label, button, switch and text field define height and width
    - Text view and image view can vary

content hugging & content compression
                 |<- content compression ->|                default: 750
    -- hugging ->|       Text              |<- hugging --   default: 250

# Debug of Auto Layout

## Types of Errors
* Unsatisfiable Layouts 
    - default new views have `translatesAutoresizingMaskIntoConstraints` set to `YES`. Programmatically default is YES, Interface Builder automatically sets to `NO`.
* Ambiguous Layouts
    - Detecting ambiguous layouts
        + hasAmbiguousLayout. Available for both iOS and OS X. Call this method on a misplaced view. It returns YES if the view’s frame is ambiguous. Otherwise, it returns NO.
        + exerciseAmbiguityInLayout. Available for both iOS and OS X. Call this method on a view with ambiguous layout. This will toggle the system between the possible valid solutions.
        + constraintsAffectingLayoutForAxis:. Available for iOS. Call this method on a view. It returns an array of all the constraints affecting that view along the specified axis.
        + constraintsAffectingLayoutForOrientation:. Available for OS X. Call this method on a view. It returns an array of all the constraints affecting that view along the specified orientation.
        + _autolayoutTrace. Available as a private method in iOS. Call this method on a view. It returns a string with diagnostic information about the entire view hierarchy containing that view. Ambiguous views are labeled, and so are views that have `translatesAutoresizingMaskIntoConstraints` set to YES.
* Logical Errors

# Advanced Auto Layout
        note: layoutMarginsGuide and readableContentGuide
* Programmatically creating constraints
    - Layout Anchors
        + let margin = view.layoutMarginsGuide
        + myView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        + myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        + myView.heightAnchor.constraint(equalTo:myView.widthAnchor, multiplier: 2.0).isActive = true
    - NSLayoutConstraint
        + NSLayoutConstrains(item: myView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    - Visual Format Language
* Working with Scroll Views
    - size and position of scroll view's frame in superview. and size of scroll view's content area
* working with self-sizing table view cells
    - default cell height determined by table view delegate’s `tableView:heightForRowAtIndexPath:` method
    - must set table view `rowHeight` to `UITableViewAutomaticDimension`.
* Changing constraints
    - deferred layout pass: 
        + using setNeedsLayout method or the setNeedsUpdateConstraints method.
        + The deferred layout pass actually involves two passes:
            * update pass: calls the `updateViewConstraints` method on all view controllers, and the `updateConstraints` method on all views.
            * layout pass: calls `viewWillLayoutSubviews` on all view controllers, and `layoutSubviews` (layout in OS X) on all views
    - batching changes 
        + overrider updateConstraints()
            * call super
            * call `setNeedsUpdateConstraints` to update it
    - custom layouts
        + do not invalidate layout of any view outside subtree
        + do not call `setNeedsUpdateConstraints` or `setNeedsLayout.`. You have just completed an update pass. Calling this method creates a feedback loop.

    Note:   layoutMarginsGuide -- 
            readableContentGuide -- 
            safeAreaLayoutGuide -- 






