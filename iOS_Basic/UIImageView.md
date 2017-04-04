# [UIImageView](https://developer.apple.com/reference/uikit/uiimageview)

Usually JPEG/PNG file.

## How images scaled:  `contentMode`

- scaleAspectFit.
		scale image until it touches first boundary (width/height) of container
- scaleAspectFill.
	- without clipping.
	- with clipping.

- scaleToFill.
		scale image without regard to original aspect ratio, image may distort
- redraw.
		option to redisplay view when bounds change by invoking `setNeedsDisplay()`. <Notify system that view's content needs to be redrawn. The view is not actually redrawn until the next drawing cycle, at which point all invalidated views are updated.>

> About `setNeedsDisplay()`

> If your view is backed by a CAEAGLLayer object, this method has no effect. It is intended for use only with views that use native drawing technologies (such as UIKit and Core Graphics) to render their content.

> Use this method to request view redrawn only when content/appearance of the view change. If only change geometry of the vie, view typically not redrawn , and existing content adjusted baed on contentMode property.

- center, top, bottom, left, right, topLeft, topRight, bottomLeft, bottomRight

## Determine final transparency of the Image

- if `imageView.isOpaque = true`, `alpha` of imageView is ignored. Default is true.
- if `imageView.isOpaque = false`, alpha value * imageView.alpha = actual transparency value for that pixel.

	> Important: computationally expensive to composite alpha channel with non-opaque imageView. If use CA shadows impact performance magnified. So, set `isOpaque = true` to improve performance.

## Animating a sequence of Images

- ImageView could store an animated image sequence and play all/part of that sequence.

	***
	UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;

    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
	***

	Note: All images should same size, and same scale.

# Responding to Touch Events

	imageView ignore user events by default.
	`isUserInteractionEnabled = true`, then could attach gesture recognizers.

# Tips Improving Performance

	- cache scaled versions of frequently used images.
	- use image close to size of imageView.
	- make imageView opaque.

# Debugging Issues with ImageView

	- Load image from asset/app bundle with `UIImage.init(named:​in:​compatible​With:​)`.
	- Load image from outside app bundle with `UIImage.image​With​Contents​Of​File:`.

# Attributes

	- image/animationImages
	- highlightedImage/highlightedAnimationImages
	- isHighlighted

# Internationalization

	- in app bundle,
	- not in app bundle, providing localized string that contains the URL.

# State Preservation

	- preserve value of `bounds`, `center`, `transform` and `anchorPoint`.


# iPhone screen size

	iPhone 4s 320 * 480 px
	iPhone 5s 320 * 568 px
	iPhone 6s 375 * 667 px
	iPhone 6+ 414 * 736 px
