struct Stack<Element> {
  fileprivate var array: [Element] = []
  
  mutating func push(_ element: Element) {
    array.append(element)
  }
  
  mutating func pop() -> Element? {
    return array.popLast()
  }
  
  func peek() -> Element? {
    return array.last
  }
}

/**
 test it,
 different type input
 concurrent

 */

// Calculator UI Tests

import XCTest

class CalcUITests: XCTestCase {
    let app = XCUIApplication()

    // MARK: - Setup and Teardown
        
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK: - Addition
    
    /**
        Performs a chained addition test. The test has two parts:
        1. Enter in the calculator and check: 6 + 2 = 8.
        2. Check: display value + 2 = 10.
    */
    func testAddition() {
        app.buttons["6"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        // Check whether the display textfield shows 8.
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "8", "Part 1 failed.")
        }
        
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        // Check whether the display textfield shows 10.
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "10", "Part 2 failed.")
        }
    }

    // MARK: - Subtraction
    
    /// Performs a substraction test. Enter in the calculator and check: 6 - 2 = 4.
    func testSubtraction() {
        app.buttons["6"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        // Check that whether the display textfield shows 4.
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "4", "Incorrect value.")
        }
    }

    // MARK: - Division
    
    /// Performs a division test. Enter in the calculator and check: 25 / 4 = 6.25.
    func testDivision() {
        app.buttons["2"].tap()
        app.buttons["5"].tap()
        app.buttons["/"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        
        // Check whether the display textfield shows 6.25.
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "6.25", "Incorrect value.")
        }
    }

    // MARK: - Multiplication
    
    /// Performs a multiplication test. Enter in the calculator and check: 19 x 8 = 152.
    func testMultiplication() {
        app.buttons["1"].tap()
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        // Check whether the display textfield shows 152.
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "152", "Incorrect value.")
        }
    }

    // MARK: - Delete
    /**
        Tests the functionality of the D (Delete) key.
        1. Enter the number 1987 into the calculator.
        2. Delete each digit, and test the display to ensure
           the correct display contains the expected value after each D tap.
    */
    func testDelete() {
        app.buttons["1"].tap()
        app.buttons["9"].tap()
        app.buttons["8"].tap()
        app.buttons["7"].tap()
        app.buttons["="].tap()
        
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "1987", "Part 1 failed.")
        }
        
        app.buttons["D"].tap()
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "198", "Part 2 failed.")
        }
        
        app.buttons["D"].tap()
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "19", "Part 3 failed.")
        }
        
        app.buttons["D"].tap()
        
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "1", "Part 4 failed.")
        }
        
        app.buttons["D"].tap()
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "0", "Part 5 failed.")
        }
    }

    // MARK: - Clear
    
    /**
        Tests the functionality of the C (Clear) key.
        1. Clear the display.
            - Enter the calculation 25 / 4.
            - Tap C.
            - Ensure the display contains the value 0.
        2. Perform corrected computation.
            - Tap 5, =.
            - Ensure the display contains the value 5.
        3. Ensure tapping C twice clears all.
            - Enter the calculation 19 x 8.
            - Tap C (clears the display).
            - Tap C (clears the operand).
            - Tap +, 2, =.
       - Ensure the display contains the value 2.
    */
    func testClear() {
        app.buttons["2"].tap()
        app.buttons["5"].tap()
        app.buttons["/"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        app.buttons["C"].tap()
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "0", "Part 1 failed.")
        }
        
        app.buttons["5"].tap()
        app.buttons["="].tap()
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "5", "Part 2 failed.")
        }
        
        app.buttons["1"].tap()
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["8"].tap()
        app.buttons["C"].tap()
        app.buttons["C"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        if let textFieldValue = app.textFields["display"].value as? String {
            XCTAssertTrue(textFieldValue == "2", "Part 3 failed.")
        }
    }
}

// CalculatorKit Test


import XCTest
@testable import CalculatorKit

class CalculatorKitTests: XCTestCase {
    // MARK: - Properties
    
    var calculator: Calculator?

    // MARK: - Setup and Teardown
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
        XCTAssertNotNil(calculator, "Cannot create Calculator instance.")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Addition
    
    /// Performs a simple addition test: 6 + 2 = 8.
    func testAddition() {
        if let calculator = calculator {
            try? calculator.input("6")
            try? calculator.input("+")
            try? calculator.input("2")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "8")
        }
    }

    // MARK: - Subtraction
    
    /// Performs a simple subtraction test: 19 - 2 = 17.
    func testSubtraction() {
        if let calculator = calculator {
            try? calculator.input("1")
            try? calculator.input("9")
            try? calculator.input("-")
            try? calculator.input("2")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "17")
        }
    }

    // MARK: - Division
    
    /// Performs a simple division test: 19 / 8 = 2.375.
    func testDivision() {
        if let calculator = calculator {
            try? calculator.input("1")
            try? calculator.input("9")
            try? calculator.input("/")
            try? calculator.input("8")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "2.375")
        }
    }
    
    // MARK: - Multiplication
    
    /// Performs a simple multiplication test: 6 * 2 = 12.
    func testMultiplication() {
        if let calculator = calculator {
            try? calculator.input("6")
            try? calculator.input("*")
            try? calculator.input("2")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "12")
        }
    }

    // MARK: - Subtraction Negative Result
    
    /// Performs a simple subtraction test with a negative result: 6 - 24 = -18.
    func testSubtractionNegativeResult() {
        if let calculator = calculator {
            try? calculator.input("6")
            try? calculator.input("-")
            try? calculator.input("2")
            try? calculator.input("4")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "-18")
        }
    }

    // MARK: - Clear Last Entry
    
    /// Tests that the clear (C) key clears the last entry when used once.
    func testClearLastEntry() {
        if let calculator = calculator {
            try? calculator.input("7")
            try? calculator.input("+")
            try? calculator.input("3")
            try? calculator.input("C")
            try? calculator.input("4")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "11")
        }
    }

    // MARK: - Clear Computation
    
    /// Tests that the clear (C) key clears the computation when used twice.
    func testClearComputation() {
        if let calculator = calculator {
            try? calculator.input("C")
            try? calculator.input("7")
            try? calculator.input("+")
            try? calculator.input("3")
            try? calculator.input("C")
            try? calculator.input("C")
            XCTAssertTrue(calculator.displayValue == "0")
        }
    }
    
    // MARK: - Input Exception
    
    /**
        Tests that the input: method throws an exception in three situations:
        1. The argument contains more than one character.
        2. The argument contains an invalid character.
        3. The argument is nil.
    */
    func testInputException() {
        if let calculator = calculator {
            XCTAssertThrowsError(try calculator.input("67")) { error in
                print(error.localizedDescription)
            }
            
            XCTAssertThrowsError(try calculator.input("j")) { error in
                print(error.localizedDescription)
            }
            
            XCTAssertThrowsError(try calculator.input(nil)) { error in
                print(error.localizedDescription)
            }
        }
    }
}

