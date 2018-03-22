# nonescaping and escaping closure

* default -- nonescaping
* nonescaping closure only be used within the bbody of function and nowhere else.
* closure and function are the same thing
    
func justDoIt(closure: () -> Void) {
    closure() 
    // by default, this closure is nonescaping! It's trapped inside this function!
}

var somethingToDo: () -> Void = {}
func doItLater(it: @escaping () -> Void) {
    // keep a reference to `it` so we can call it later...
    somethingToDo = it
}

# Using Escaping Closures for Asynchronous Tasks

    func downloadAndDisplayImage(imageURL: URL, updateImage: @escaping (UIImage?) -> Void) {
        // create network request
        let task = URLSession.shared.dataTask(with: myImageURL) { (data, response, error) in
            // if no error, then create image and pass it to the completion handler
            if let downloadedImage = UIImage(data: data!), error == nil {
                DispatchQueue.main.async {
                    updateImage(downloadedImage)
                }
            } else {
                // otherwise, pass nil to the completion handler
                DispatchQueue.main.async {
                    updateImage(nil)
                }
            }
        }
        task.resume()
    }

# Why escaping Closure? 
## Improving performance and optimizing memory allocation for swift


1. let f = {(x: Int) -> Int in
    return x + 42
}
func f(x: Int) -> Int {
    return x + 42
}
f(3) // 45
2. let closures = [f, {(x: Int -> Int in return x * 2)}, {x in x*x}, {$0 * 42}]
for fn in closures {
    fn(42) 
}
3. 
let deepThought = {(ask question: String in
    return "the answer to \"\(question)\" is \(7*6)!"
)}
4. 
let sum = {(a: Int, b: Int -> Int in return a+b)}
let sumf = {(a: Float, b: Float -> Float in return a+b)}

typealias  Integer = Int
let z: Integer = 42
let zz: Int = 42

typealias IntMaker = (Void)->Int
func makeCounter()->IntMaker {
    var n = 0
    func adder()-> Int {
        n = n + 1
        return n
    }
    return adder
}
let counter1 = makeCounter() // ()->Int
let counter2 = makeCounter() // ()->Int

counter1() // 1
counter1() // 2
counter2() // 1

var z = 4.2 
func g(x: Int) -> Double {
    return DOubbble(x)/z    // z could reach, this function works!
}

# GCD Threads
## makes asynchronous programming easier and safer by hiding threads from developer
## Serial, sync
## concurrency, async
* only concurrent queues allow for concurrent programming on iOS (false), since each serial queue could run on its own thread and will not block each other.

## Main Functions in GCD
- DispatchQueue -- represent a queue
- DispatchQueue(label: attributes: ) -- create a queue // attribute: .serial .concurrent
- DispatchQueue(label: ) -- create a queue
- async // add closure to queue, and the closure will run somtime in the immediate future
- DispatchQueue.global(qos: ) 
    + //QOS_CLASS_utility, Background, initiated, interactive
    + iOS always gives each app four extra queues on top of the name one
- DispatchQueue.main
- 
