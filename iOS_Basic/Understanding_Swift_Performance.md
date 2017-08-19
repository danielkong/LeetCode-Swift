Understand Swift Performance 2016

	related: protocol and value Oriented Programming in UIKit Apps
			protocol Oriented Programming in swift 2015
			building better apps with value types in swift

first class types:
	class
	struct
	enum
	Inheritance
	protocol
	generics

choosing right abstraction mechanism

underlying Implementation

agenda
	allocation
	reference counting
	method dispatch  -- static/dynamic

building

allocate on stack push pop off, keep a point to end of stack
	cost of assigning an integer
	contrast to
	heap(heap more dynamic but less efficient than stack)
		allocate memory with a dynamic lifetime
		need advanced data structure
		allocate memory on heap and search to find an unused block of the appropriate size.
		deallocate need to re-insert memory back to that appropriate position.
		multiple threads can be allocating memory on the heap at the same time, so it needs protect its integrity using lock/other sync

struct example:
	point2 = point1
	copy contents
	value semantics
class example:
	point2 = point1
	copy reference
	reference semantics

Class more complex than struct because class require a heap allocation, but classes have some powerful characteristics, like identity and indirect storage.

1. add caching layer, only once generate image

	var cache = [String: UIImage]()
	func makeBalloon() -> UIImage {
		let key = "\(color):\(orientation)" // but this part every time incurring a heap allocation. Solution: just using a struct.
		if let image = cache[key] {
			return image
		}
	}

2. use a struct for key. much safer than string, and structs are first class types in swift. struct does not require any heap allocation
	struct Attributes {
		var color: color
		var orientation: orientation
		var tail: Tail
	}

reference counting
	keep reference count on the heap
	no one pointing to this instance on the heap anymore and safe to deallocate that memory
	several things need to mention:
		couple levels of indirection involved
		thread safety overhead. since on multiple threads at same time and references can be added or removed to any heap instance. atomically increment and decrement to reference count.

	no reference count in simple struct since no heap allocation involved
	but if struct contain class, it involved heap
	struct Label {
		var text: String // String: the contents of its characters on the heap, so this needs to be reference counted.
		var font: UIFont // font is a class, so also needs to be reference counted.
		func draw() { ... }
	}

	let label1 = Label(text: "Hi" font: ... )

	Another Example:
		struct Attachment {
			let fileURL: URL
			let uuid: String
			let mimeType: String

			init?(fileURL: URL, uuid: String, mimeType: String) {
				guard mimeType:isMimeType
				else { return nil }
				self.fileURL = fileURL
				self.uuid = uuid
				self.mimeType = mimeType
			}
		}

		Emmm, three of properties incurring reference counting, how to do it better?
		1. change uuid from string to UUID
		2. mimeType use enum instead
			enum MimeType {
				init?(rawValue: String) {
					switch rawValue {
						case "image/jpeg":
							self = .jpeg
						case "image/png":
							self = .png
						case "image/gif":
							self = .gif
						defalut:
							self = nil
					}
				}
			}
		Do not need to be reference counted/heap allocated

	Method Despatch
		Static
			Jump directly to Implementation at runtime
			Candidate for inlining and other optimizations
		Dynamic dispatch
			at runtime look up implementation
			Then jump to implementation
			But this dynamic dispatch blocks the visibility of the compiler(compiler could do optimizations for static dispatches)

		What's inlining?
			struct Point {
				var x, y: Double
				func draw() {
					// point.draw implementation
				}
			}

			func drawAPoint(_ param: Point) {
				param.draw()
			}

			let point = Point(x: 0, y: 0)
			drawAPoint(point) // here, we could replace to point.draw or // point.draw implementation

		If so, why do we need dynamic dispatch thing at all?
			1. enables really powerful things, like Polymorphism
			2.   
		Inheritance-Based Polymorphism

		class  Drawable { func draw() {} }
		class Point: Drawable {
			var x, y: Double
			override func draw() { ... }
		}
		class Line: Drawable {
			var x1, y1, x2, y2: Double
			override func draw() { ... }
		}

		var drawables: [Drawable]
		for d in drawables {
			d.draw() // compiler could not determine at compile time which implementation should be run. It look up virtual table and based on type run method implementation.
		}

		Final class -- statically dispatch those methods
		if a class has no subclass, optimizing to static method from dynamic.(Could check with video WWDC2015 optimizing swift performance)

		This is instance allocate on the tack or the heap?
		Pass this instance, how much reference containing overhead will go to incur?
		When I call a method of this instance, is it going to be statically/dynamically dispatched.

	Could we do Polymorphism with struct? (Protocol Oriented Programming)
	Protocol Types

		protocol Drawable { func draw() }
		struct Point: Drawable {
			var x, y: Double
			func draw() { ... }
		}
		struct Line: Drawable {
			var x1, y1, x2, y2: Double
			func draw() { ... }
		}
		class sharedLine: Drawable {
			var x1, y1, x2, y2: Double
			func draw() { ... }
		}

		if it's not do V-table(virtual table), it's a table based mechanism called Protocol Witness Table
		But how the array store different sizes of data. (Point 2 words, Line 4 words)? -- Existential Container (Special storage layout)
			1. Inline value buffer: currently 3 words.
			2. Large values stored on heap (allocate memory on heap and store a pointer to that memory inside)
			How to manage whether store in stack or heap? -- table based mechanism(Value Witness Table) -- (allocation, copy, destruction of any value) manage lifetime of our value
			3. reference to value witness table
			4. reference to protocol witness table

		Protocol Type with Small value
			fits in value buffer: no heap allocation
			no reference counting
			Dynamic dispatch through protocol witness table.

		Protocol Type with Small value
			Heap allocation -- (use copy and write to trade expensive heap allocation)
			potential reference counting if value contains references

	Last part: How generic type are stored and copied, and how method dispatch for them.
	Generic Code

		protocol Drawable { func draw() }
		func drawACopy<T: Drawable>(local : T) {
			local.draw()
		}

		let line = Line()
		drawACopy(line)

		 Generic code support more static polymorphism also known as parametric polymorphism.
		 One type per call context

	Specialization of Generics -- stuct type
		type does not change at runtime
		performance characteristic like struct types
			no heap allocation on copying
			no reference counting
		performance characteristic like struct types
			heap allocation on creating an instance
			reference counting
			dynamic method dispatch through V-table
