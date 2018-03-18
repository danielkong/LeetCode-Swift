Cocoa Design Pattern 
[https://developer.apple.com/legacy/library/documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaDesignPatterns/CocoaDesignPatterns.html]

iOS Design Pattern
[https://www.raywenderlich.com/46988/ios-design-patterns]

一、设计模式的分类
总体来说设计模式分为三大类：

* 创建型模式，共五种：工厂方法模式、抽象工厂模式、单例模式、建造者模式、原型模式。
* 结构型模式，共七种：适配器模式、装饰器模式、代理模式、外观模式、桥接模式、组合模式、享元模式。
* 行为型模式，共十一种：策略模式、模板方法模式、观察者模式、迭代子模式、责任链模式、命令模式、备忘录模式、状态模式、访问者模式、中介者模式、解释器模式。
* 其实还有两类：并发型模式和线程池模式。
用一个图片来整体描述一下：
设计模式主要分三个类型:创建型、结构型和行为型。
其中创建型有：
一、Singleton，单例模式：保证一个类只有一个实例，并提供一个访问它的全局访问点
二、Abstract Factory，抽象工厂：提供一个创建一系列相关或相互依赖对象的接口，而无须指定它们的具体类。
三、Factory Method，工厂方法：定义一个用于创建对象的接口，让子类决定实例化哪一个类，Factory Method使一个类的实例化延迟到了子类。
四、Builder，建造模式：将一个复杂对象的构建与他的表示相分离，使得同样的构建过程可以创建不同的表示。
五、Prototype，原型模式：用原型实例指定创建对象的种类，并且通过拷贝这些原型来创建新的对象。
行为型有：
六、Iterator，迭代器模式：提供一个方法顺序访问一个聚合对象的各个元素，而又不需要暴露该对象的内部表示。
七、Observer，观察者模式：定义对象间一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知自动更新。
八、Template Method，模板方法：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中，TemplateMethod使得子类可以不改变一个算法的结构即可以重定义该算法得某些特定步骤。
九、Command，命令模式：将一个请求封装为一个对象，从而使你可以用不同的请求对客户进行参数化，对请求排队和记录请求日志，以及支持可撤销的操作。
十、State，状态模式：允许对象在其内部状态改变时改变他的行为。对象看起来似乎改变了他的类。
十一、Strategy，策略模式：定义一系列的算法，把他们一个个封装起来，并使他们可以互相替换，本模式使得算法可以独立于使用它们的客户。
十二、China of Responsibility，职责链模式：使多个对象都有机会处理请求，从而避免请求的送发者和接收者之间的耦合关系
十三、Mediator，中介者模式：用一个中介对象封装一些列的对象交互。
十四、Visitor，访问者模式：表示一个作用于某对象结构中的各元素的操作，它使你可以在不改变各元素类的前提下定义作用于这个元素的新操作。
十五、Interpreter，解释器模式：给定一个语言，定义他的文法的一个表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。
十六、Memento，备忘录模式：在不破坏对象的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。
结构型有：
十七、Composite，组合模式：将对象组合成树形结构以表示部分整体的关系，Composite使得用户对单个对象和组合对象的使用具有一致性。
十八、Facade，外观模式：为子系统中的一组接口提供一致的界面，fa?ade提供了一高层接口，这个接口使得子系统更容易使用。
十九、Proxy，代理模式：为其他对象提供一种代理以控制对这个对象的访问
二十、Adapter,适配器模式：将一类的接口转换成客户希望的另外一个接口，Adapter模式使得原本由于接口不兼容而不能一起工作那些类可以一起工作。
二十一、Decrator，装饰模式：动态地给一个对象增加一些额外的职责，就增加的功能来说，Decorator模式相比生成子类更加灵活。
二十二、Bridge，桥模式：将抽象部分与它的实现部分相分离，使他们可以独立的变化。
二十三、Flyweight，享元模式

Chapter 1 Introduction

Model:
* In an ideal situation, a model object should not have any explicit association with any user interface used for presenting and editing it
View:
*  respond to user actions
*  present itself onscreen
*  Except for performance reasons (such as when a view needs to cache data), the view should not be used for storing the data it is presenting
*  Since view objects can work with many different model objects, they tend to be reusable and consistent across different applications.

Controller:
*  controller object acts like a middleman between view and model objects.(Mediator Pattern)
*  controller objects can perform other operations for an application
    *  managing the life cycles of other objects
    * performing setup
    * coordinating tasks for the application
Cocoa(Touch) version of MVC comprises:
* Composite pattern
    *  The view components in the hierarchy can range from compound views (such as table views) to individual views (such as text boxes or buttons).
* Command pattern (view defer execution on controller)
    *  This is a target-action mechanism in which view objects can defer an execution on other objects, such as controllers, until certain events have occurred.
* Mediator pattern (controller)
    *  controller plays middleman that adopts Mediator pattern. Changes in model are communicated to view objects through the controller objects  of an application
* Strategy pattern (controller)
    * a controller an be a strategy for any view object.
* Observer pattern (model observer to controller)
    *  A model object keeps interested objects such as controllers updated with any changes to its internal state
*
Programming a interface, not an implementation
* class
* object
* inheritance   — different with poly: use structure & behavior of super
* polymorphism —                            change behavior of super
    * depends on the interfaces
    *  Java allow developers to define a type of “interface” (compared to a class) that defines a “contract” between clients and concrete objects being used. In objective C, it called protocol, it let objects share the same interfaces
* Inheritance.
    *  An interface defines a type, and interface inheritance (subtyping) allows you to use an object in place of another
Implementation using @protocol vs. Abstract Base Class (ABC)
*  A protocol is an “interface” that only defines abstract behavior.
*  Another way to define a high-level abstract type is to define an abstract base class (ABC).
    * Can create some default behavior that other subclasses can share.
    * Regular classes but it leaves out some behavior that can or should be overridden by subclasses.
* Difference:
    *  If you decide to change a protocol that you have defined in the past, you will probably break the other classes that implement it. The only exception is when you only change some of the protocol methods to become “optional” with a @optional  directive. Since objective C is not support multiple-inheritance.
    *  ABC Free to add new methods to an abstract base class without breaking the rest of the inheritance chain.
* Syntax difference: If we call it Mark
        * protocol — id<Mark> *thisMark;
        * ABC — Mark *thisMark;
* Flexible solution for
Object Composition vs. Class Inheritance
* Reusing a subclass can be problematic due implementation dependencies. One solution for this is to inherit (subtype) only from protocol(s) or abstract (base) class(es), as they usually have little or, in a protocol, no implementation.
*  Object composition lets you use one object with many others as each expects the others’ interfaces to work.
Class Diagram
 OMT (Object Modeling Technique) notation
* Protocol, Abstract Class, Concrete Class, and Category

Instantiation

Inheritance

Acquaintance
*  Figure 1–7 shows the relationship in that ConcreteClass  has a reference to an AnotherClass  object, but it doesn’t “own” the life of the AnotherClass  object and the reference can be shared by other objects. Or simply, ConcreteClass  “knows” AnotherClass .

Aggregation
*  ConcreteClass owns  AnotherClass as part of  ConcreteClass, so both  ConcreteClass and  AnotherClass are an aggregate. The diagram of the figure also demonstrates another attribute of a reference. I use a doubleheaded
arrow to mean “more than one.” So, in the case of  ConcreteClass, it contains multiple instances of  AnotherClass as  instanceVariable_.



Chapter 2 Design App
* View
    * Transition from view to view
    * mediator to coordinate view transitions
*

Object Design Pattern
1. Prototype — needs true copy, copyWithZone <NSCopying> protocol
2. Factory Method
3. Abstract Factory
4. Builder
5. Singleton

Chapter 3 Prototype
* Shallow copying v.s. Deep copying

shallow copy above

deep copy above

Prototype design pattern needs true copy, means deep copying.
* NSObject’s deep copying. — NSCopying
    * (id)copyWithZone:(NSZone *)zone
    * instance method (id)copy default call [self copyWithZone:nil]

Listing 3–1. Mark.h
@protocol Mark <NSObject>
@property (nonatomic, retain) UIColor * color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count; // number of children
@property (nonatomic, readonly) id <Mark> lastChild;
- (id) copy;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;
@end

---------------

Listing 3–2. Vertex.h
#import "Mark.h"
@interface Vertex : NSObject <Mark, NSCopying>
{
@protected
CGPoint location_;
}
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;
- (id) initWithLocation:(CGPoint) location;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index; // needs to be added to draft
- (id) copyWithZone:(NSZone *)zone;
@end
why is there no copy  method and copyWithZone:  instead?
* The NSObject  protocol doesn’t have a copy method declared, but NSObject  does.
* That’s why we need to let the Vertex  class adopt the NSCopying  protocol and implement its copyWithZone:zone method for the cloning process. However, the NSObject  protocol doesn’t have a method copy  declared, so we also declared it in our Mark  protocol to avoid compiler warnings.
Listing 3–3. Vertex.m
#import "Vertex.h"
@implementation Vertex
@synthesize location=location_;
@dynamic color, size;
- (id) initWithLocation:(CGPoint) aLocation
{
if (self = [super init])
{
[self setLocation:aLocation];
}
return self;
}
// default properties do nothing
- (void) setColor:(UIColor *)color {}
- (UIColor *) color { return nil; }
- (void) setSize:(CGFloat)size {}
- (CGFloat) size { return 0.0; }
// Mark operations do nothing
- (void) addMark:(id <Mark>) mark {}
- (void) removeMark:(id <Mark>) mark {}
- (id <Mark>) childMarkAtIndex:(NSUInteger) index { return nil; }
- (id <Mark>) lastChild { return nil; }
- (NSUInteger) count { return 0; }
- (NSEnumerator *) enumerator { return nil; }
#pragma mark -
#pragma mark NSCopying method
// it needs to be implemented for memento
- (id)copyWithZone:(NSZone *)zone
{
Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
return vertexCopy;
}
@end

Listing 3–4. Dot.h
#import "Vertex.h"
@interface Dot : Vertex
{
@private
UIColor *color_;
CGFloat size_;
}
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
- (id) copyWithZone:(NSZone *)zone;
@end

Listing 3–5. Dot.m
#import "Dot.h"
@implementation Dot
@synthesize size=size_, color=color_;
- (void) dealloc
{
[color_ release];
[super dealloc];
}
#pragma mark -
#pragma mark NSCopying delegate method
- (id)copyWithZone:(NSZone *)zone
{
Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
// copy the color
[dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
// copy the size
[dotCopy setSize:size_];
return dotCopy;
}
@end


Chapter 4 Factory Method  —   an integral part of the Abstract Factory pattern



When to use it?

 You’d naturally think about using the Factory Method pattern when
􀀁  The exact class of objects created can’t be anticipated at compile
time.
􀀁  A class wants its subclasses to decide what to create at runtime.
􀀁  A class has some helper classes as its subclasses and you want to
localize the knowledge of which one to return.

Example:
*  Even though you can create an instance of NSNumber  with a typical alloc init  two-step approach, it doesn’t do much unless you use one of its predefined class factory methods to create a meaningful instance of it. For example, a message [NSNumber numberWithBool:YES]  will get you an instance of NSNumber ’s subclass (NSCFBoolean) that contains the Boolean value provided to the class factory method.

Why is it a safe approach to creating objects?

* Share a common set of behavior. So any new introduction of new concrete products to the class hierarchy doesn’t need any code changes to the client code.
Example:

*  An instance of a specific CanvasView  is created by a factory method,
canvasViewWithFrame:aFrame , defined in CanvasViewGenerator  abstract class. There are
two subclasses of CanvasViewGenerator . Each of them is responsible for creating an
instance of a specific CanvasView  by overriding the parent’s canvasViewWithFrame:
 method.
* Listing 4–1. PaperCanvasView.h
#import <UIKit/UIKit.h>
#import "CanvasView.h"
@interface PaperCanvasView : CanvasView
{
// some private variables
}
// some other specific behaviors
@end
* #import "PaperCanvasView.h"
@implementation PaperCanvasView
* - (id)initWithFrame:(CGRect)frame
{
if ((self = [super initWithFrame:frame]))
{
// Add a paper image view on top
// as the canvas background
UIImage *backgroundImage = [UIImage imageNamed:@"paper"];
UIImageView *backgroundView = [[[UIImageView alloc]
initWithImage:backgroundImage]
autorelease];
[self addSubview:backgroundView];
}
return self;
}
// implementation for other behaviors
@end
* Listing 4–5. CanvasViewGenerator.h
#import "CanvasView.h"
@interface CanvasViewGenerator : NSObject
{
}
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame;
@end
Listing 4–6. CanvasViewGenerator.m
#import "CanvasViewGenerator.h"
@implementation CanvasViewGenerator
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame
{
return [[[CanvasView alloc] initWithFrame:aFrame] autorelease];
}
@end
* Listing 4–7. PaperCanvasViewGenerator.h
#import "CanvasViewGenerator.h"
#import "PaperCanvasView.h"
* @interface PaperCanvasViewGenerator : CanvasViewGenerator
{
}
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame;
@end
Listing 4–8. PaperCanvasViewGenerator.m
#import "PaperCanvasViewGenerator.h"
@implementation PaperCanvasViewGenerator
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame
{
return [[[PaperCanvasView alloc] initWithFrame:aFrame] autorelease];
}
@end
* Listing 4–9. ClothCanvasViewGenerator.h
#import "CanvasViewGenerator.h"
#import "ClothCanvasView.h"
@interface ClothCanvasViewGenerator : CanvasViewGenerator
{
}
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame;
@end
Listing 4–10. ClothCanvasViewGenerator.m
#import "ClothCanvasViewGenerator.h"
@implementation ClothCanvasViewGenerator
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame
{
return [[[ClothCanvasView alloc] initWithFrame:aFrame] autorelease];
}
@end
* Listing 4–11. CanvasViewController.h
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
@interface CanvasViewController : UIViewController
{
@private
CanvasView *canvasView; // a canvas view
}
@property (nonatomic, retain) CanvasView *canvasView;
- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;
@end
* Listing 4–12. CanvasViewController.m
#import "CanvasViewController.h"
@implementation CanvasViewController
@synthesize canvasView=canvasView_;
// Implement viewDidLoad to do additional setup after loading the view,
// typically from a nib.
- (void)viewDidLoad
{
[super viewDidLoad];
// Get a default canvas view
// with the factory method of
// the CanvasViewGenerator
CanvasViewGenerator *defaultGenerator = [[[CanvasViewGenerator alloc] init]
autorelease];
[self loadCanvasViewWithGenerator:defaultGenerator];
}
// Unrelated methods are removed for the sake of brevity
#pragma mark -
#pragma mark Loading a CanvasView from a CanvasViewGenerator
- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator*)generator
* {
[canvasView_ removeFromSuperview];
CGRect aFrame = CGRectMake(0, 0, 320, 436);
CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
[self setCanvasView:aCanvasView];
[[self view] addSubview:canvasView_];
}
* {
[canvasView_ removeFromSuperview];
CGRect aFrame = CGRectMake(0, 0, 320, 436);
CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
[self setCanvasView:aCanvasView];
[[self view] addSubview:canvasView_];
}
@end


Chapter 4 Factory Method —   an integral part of the Abstract Factory pattern
* concrete Factory Method — create own product(objects) by using overridden parent abstract factory class

Chapter 5 Abstract Factory
* Pizza Example:
.h file
@interface BrandingFactory : NSObject
{
}
+ (BrandingFactory *) factory;
- (UIView *) brandedView;
- (UIButton *) brandedMainButton;
- (UIToolbar *) brandedToolbar;
@end
.m file
1. #import "BrandingFactory.h”
2. #import "AcmeBrandingFactory.h”
3. #import “SierraBrandingFactory.h"
4.
@implementation BrandingFactory
+ (BrandingFactory *) factory {
#if defined (USE_ACME)
  return [[[AcmeBrandingFactory alloc] init] autorelease];
5. #elif defined (USE_SIERRA)
  return [[[SierraBrandingFactory alloc] init] autorelease];
6. #else
  return nil;
#endif
}
1. - (UIView *) brandedView{
2.   return nil;}
3. - &nbsp;&nbsp;(UIButton *) brandedMainButton{
  return nil;}
4. - &nbsp;&nbsp;(UIToolbar *) brandedToolbar{
  return nil;}
@end
Chapter 7 Singleton — an object of a class be sole instance in a system. (e.g.: UIApplication, NSFileManager, UIAccelerometer...)

* When use singleton patter?
    * must be exactly one instance of a class with which it must be accessible from a well-known access point.
    * sole instance can be extended only by subclassing and won’t break client code with extended object.
Within project, it might be okay to use local variable hold single reference to an instance of a class, but if others use same type of static global variable will become trouble, so we need singleton.
* How to create singleton?
    * @interface Singleton: NSObject {}
+ (Singleton *)sharedInstance;

@implementation Singleton
static Singleton *_sharedInstance = nil;

+(Singleton *)sharedInstance {
    if (_sharedInstance == nil) {
        _sharedInstance = [SharedInstance alloc] init]; // [super allocWithZone:NULL] init];
    }
    return _sharedInstance;
}
@end
    * In above, might meet two major hurdle problems:
        * calling object cannot instantiate a singleton through other means of allocation.
        * restrictions on instantiating a singleton object should also co-exist with reference touting memory models.
* Thread Safety
    * can be accessed by multiple threads. To make it safe, we can put some @synchronized() blocks or NSLock instances around the nil check for _sharedInstance static instance.
        * if some other properties also need to be protected, we can make them atomic too.
* Using singletons in Cocoa Touch
    * UIApplication:
        * dispatching action messages for UIControl to target objects
        * maintain list of all UIWindow objects be opened in app.
    * UIAccelerometer — iOS 2.0 - 5.0, iOS 6 or later use CoreMotion
        * updateInterval as well its delegate properties.
    * NSFileManager: — singleton, but not thread safe.



Chapter 8 Adapter

* Two ways to implement Adapter pattern.
    * class adapter —  protocol in obj-C (multiple inheritance in other language)
        * Multiple inheritance in obj-C: A class implement protocol and inherits a superclass
        * can be implemented in obj-C only when target is protocol but not a class.
    * object adapter (a.k.a. delegate) — keep reference to Adaptee.
    * command pattern with NSInvocation. It could generic enough to encapsulate and invoke a target-action
* Implement adapter pattern with Protocol.
    * Implement own delegation as an adapter.
* Implement adapter pattern with blocks (from iOS 4.0)
    * declare block reference
        * int (^objectiveCBlock)(int);  // int (*CFunctionPointer)(float);
        * typedef int (^objectiveCBlock)(int);
objectiveCBlock aBlock = ^(int anInt) { return anInt++; }
int result = aBlock(5);

typedef void (^RGBValuesProvider) (CGFloat *red, CGFloat *green, CGFloat *blue);
@property (nonatomic, copy) RGBValuesProvider RGBValuesProvider;
        *
Chapter 9 Bridge

* in class A, set property B, in A function call B function.

Chapter 10 Facade

* e.g:
    * Car: NSObject
        * releaseBrakes;
        * changeGears;
        * pressAccelerator;
        * pressBrakes;
        * releaseAccelerator;
    * Taximeter: NSObject
        * start;
        * stop;
    * CabDriver: NSObject
        * driveToLocation: (CGPoint) x; // in this implementation, we use facade method to simple call this and handle all things under hood.
