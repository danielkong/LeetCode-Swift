# GCD Threads
## makes asynchronous programming easier and safer by hiding threads from developer
## Serial, sync
## concurrency, async
* only concurrent queues allow for concurrent programming on iOS (false), since each serial queue could run on its own thread and will not block each other.

## Main Functions in GCD
### GCD Provide 3 main types of queues

- main queue : serial queue on main thread
- global queue : 4 concurrent queeus with diff priorities (QoS -- Quality of Service)
- custom queue : 

## Synchronous vs. Asynchronous
With GCD, you can dispatch a task either synchronously or asynchronously.

A synchronous function returns control to the caller after the task is completed.

An asynchronous function returns immediately, ordering the task to be done but not waiting for it. Thus, an asynchronous function does not block the current thread of execution from proceeding on to the next function.



- DispatchQueue -- represent a queue
- DispatchQueue(label: attributes: ) -- create a queue // attribute: .serial .concurrent
- DispatchQueue(label: ) -- create a queue
- async // add closure to queue, and the closure will run somtime in the immediate future
-  asyncAfter(deadline: DispatchTime, qos: DispatchQoS = default, flags: DispatchWorkItemFlags = default, execute work: @escaping @convention(block) () -> Swift.Void)
- DispatchQueue.global(qos: ) 
    + //QOS_CLASS_utility, Background, initiated, interactive
    + iOS always gives each app four extra queues on top of the name one
- DispatchQueue.main
- If update UIView in other queue(not main queue), it not crash every time, like 6 of 10 times.

    @IBAction func simpleAsynchronousDownload(_ sender: UIBarButtonItem) {
        // Get the URL for the image
        let url = URL(string: BigImages.shark.rawValue)
        // create a queue from scratch
        let downloadQueue = DispatchQueue(label: "download", attributes: [])
        // call dispatch async to send a closure to the downloads queue
        downloadQueue.async { () -> Void in
            // download Data
            let imgData = try? Data(contentsOf: url!)
            // Turn it into a UIImage
            let image = UIImage(data: imgData!)
            // display it
            DispatchQueue.main.async(execute: { () -> Void in
                self.photoView.image = image
            })
        }
    }

## Handling the Readers-Writers Problem
- create read/write lock using `dispatch barriers`. (A group functions acting as serial-style bottleneck when working with concurrent queues.)
- set a flag indicate only item execute on specified queue for particular time.
- dispatch barrier do not need in serial queue. In custom concurrent queue to handle barrier function and separate read write functions. allow multiple read simultaneously.

https://www.raywenderlich.com/148515/grand-central-dispatch-tutorial-swift-3-part-2

# Extra: 

## nonescaping and escaping closure

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

