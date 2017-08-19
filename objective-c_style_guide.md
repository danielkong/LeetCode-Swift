Objective C Style

Example:
An example header file
#import <Foundation/Foundation.h>

// A sample class demonstrating good Objective-C style. All interfaces,
// categories, and protocols (read: all non-trivial top-level declarations
// in a header) MUST be commented. Comments must also be adjacent to the
// object they're documenting.
//
// (no blank line between this comment and the interface)
@interface Foo : NSObject

// Returns an autoreleased instance of Foo. See -initWithBar: for details
// about |bar|.
+ (instancetype)fooWithBar:(NSString *)bar;

// Designated initializer. |bar| is a thing that represents a thing that
// does a thing.
- (instancetype)initWithBar:(NSString *)bar;

// Gets and sets |_bar|.
- (NSString *)bar;
- (void)setBar:(NSString *)bar;

// Does some work with |blah| and returns YES if the work was completed
// successfully, and NO otherwise.
- (BOOL)doWorkWithBlah:(NSString *)blah;

@end

An example source file
#import "Foo.h"


@implementation Foo {
  NSString *_bar;
  NSString *_foo;
}

+ (instancetype)fooWithBar:(NSString *)bar {
  return [[[self alloc] initWithBar:bar] autorelease];
}

// Must always override super's designated initializer.
- (instancetype)init {
  return [self initWithBar:nil];
}

- (instancetype)initWithBar:(NSString *)bar {
  if ((self = [super init])) {
    _bar = [bar copy];
    _bam = [[NSString alloc] initWithFormat:@"hi %d", 3];
  }
  return self;
}

- (void)dealloc {
  [_bar release];
  [_bam release];
  [super dealloc];
}

- (NSString *)bar {
  return _bar;
}

- (void)setBar:(NSString *)bar {
  [_bar autorelease];
  _bar = [bar copy];
}

- (BOOL)doWorkWithBlah:(NSString *)blah {
  // ...
  return NO;
}

@end

Spacing and Formatting
	Tabs v.s. Space
		Use only spaces, and indent 2 spaces at a time.
		We use spaces for indentation. Do not use tabs in your code. You should set your editor to emit spaces when you hit the tab key.

	Line length 100 line

	Method Declarations and Definitions
		- (void)doSomethingWithString:(NSString *)theString {
			...
		}

	Method Invocations
		[myObject doFooWith:arg1 name:arg2 error:arg3];

	@public and @private
		The @public and @private access modifiers should be indented by 1 space.

	Exceptions
		@try {
  			foo();
		}
		@catch (NSException *ex) {
  			bar(ex);
		}
		@finally {
  			baz();
		}

	Blocks
        Code inside blocks should be indented four spaces.

        // The entire block fits on one line.
        [operation setCompletionBlock:^{ [self onOperationDone]; }];

        // The block can be put on a new line, indented four spaces, with the
        // closing brace aligned with the first character of the line on which
        // block was declared.
        [operation setCompletionBlock:^{
            [self.delegate newDataAvailable];
        }];

        // Using a block with a C API follows the same alignment and spacing
        // rules as with Objective-C.
        dispatch_async(_fileIOQueue, ^{
            NSString* path = [self sessionFilePath];
            if (path) {
              // ...
            }
        });

        // An example where the parameter wraps and the block declaration fits
        // on the same line. Note the spacing of |^(SessionWindow *window) {|
        // compared to |^{| above.
        [[SessionService sharedService]
            loadWindowWithCompletionBlock:^(SessionWindow *window) {
                if (window) {
                  [self windowDidLoad:window];
                } else {
                  [self errorLoadingWindow];
                }
            }];

        // An example where the parameter wraps and the block declaration does
        // not fit on the same line as the name.
        [[SessionService sharedService]
            loadWindowWithCompletionBlock:
                ^(SessionWindow *window) {
                    if (window) {
                      [self windowDidLoad:window];
                    } else {
                      [self errorLoadingWindow];
                    }
                }];

        // Large blocks can be declared out-of-line.
        void (^largeBlock)(void) = ^{
            // ...
        };
        [_operationQueue addOperationWithBlock:largeBlock];

        // An example with multiple inlined blocks in one invocation.
        [myObject doSomethingWith:arg1
            firstBlock:^(Foo *a) {
                // ...
            }
            secondBlock:^(Bar *b) {
                // ...
            }];

        Container Literals
        For projects using Xcode 4.4 or later and clang, the use of container (array and dictionary) literals is encouraged. If split across multiple lines, the contents should be indented two spaces.
If the collection fits on one line, put a single space after the opening and before the closing brackets.

NSArray* array = @[ [foo description], @"Another String", [bar description] ];

NSDictionary* dict = @{ NSForegroundColorAttributeName : [NSColor redColor] };
Not:

NSArray* array = @[[foo description], [bar description]];

NSDictionary* dict = @{NSForegroundColorAttributeName: [NSColor redColor]};
If the collection spans more than a single line, place the opening bracket on the same line as the declaration, indent the body by two spaces, and place the closing bracket on a new line that is indented to the same level as the opening bracket.

NSArray* array = @[
  @"This",
  @"is",
  @"an",
  @"array"
];

NSDictionary* dictionary = @{
  NSFontAttributeName : [NSFont fontWithName:@"Helvetica-Bold" size:12],
  NSForegroundColorAttributeName : fontColor
};
For dictionary literals, there should be one space before the colon and at least one space after it (to optionally align the values).

NSDictionary* option1 = @{
  NSFontAttributeName : [NSFont fontWithName:@"Helvetica-Bold" size:12],
  NSForegroundColorAttributeName : fontColor
};

NSDictionary* option2 = @{
  NSFontAttributeName :            [NSFont fontWithName:@"Arial" size:12],
  NSForegroundColorAttributeName : fontColor
};
The following are all incorrect:

// There should be a space before the colon.
NSDictionary* wrong = @{
  AKey:       @"b",
  BLongerKey: @"c",
};

// The items should each be on a new line, or the entire expression
// should fit on one line.
NSDictionary* alsoWrong= @{ AKey : @"a",
                            BLongerKey : @"b" };

// There should be no variable space before the colon, only after.
NSDictionary* stillWrong = @{
  AKey       : @"b",
  BLongerKey : @"c",
};
