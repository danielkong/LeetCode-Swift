// Draw Circle
/**
Draw a circle with radius R.
draw circle(requires no gaps between points),
Try to optimize the solution as much as possible.
You can assume the center is the original point.
*/

// Solution 1: x^2 + y^2 = r^2

func draw_circle(radius: Int) {
	var x, y
	for x in -radius ... radius {
		y = sqrt(radius * radius - x*x)
		draw_point(x, y)
		draw_point(x, -y)
	}
}

// Solution 2: divide to 4 zone

func draw_circle(radius: Int) {
	var l = radius * cos(PI/4)
	for x in 0...l {
		y = sqrt(radius * radius - x*x)
		draw_point(x, y)
		draw_point(x, -y)
		draw_point(-x, y)
		draw_point(-x, -y)
	}
}

// Solution 3: plot filled circle

func draw_filled_circle(radius: Int) {
	for x in -radius ... radius {
		for y in -radius ... radius {
			if x*x+y*y <= radius*radius {
				draw_point(x, y)
			}
		}
	}
}
