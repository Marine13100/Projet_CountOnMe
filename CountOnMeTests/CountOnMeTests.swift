//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Marine Bernard on 23/07/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//
@testable import CountOnMe
import XCTest

class CountOnMeTests: XCTestCase {

    var calculator:Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    
    func testAdditionMethod_WhenCalculIsCorrect_ThenShouldReturnCorrectResult() {
        calculator.tappedNumberButton(numberText: "1")
        calculator.tappedAdditionButton()
        calculator.tappedNumberButton(numberText: "1")
        calculator.tappedEqualButton()
        XCTAssertEqual(calculator.calculText, "1 + 1 = 2")
    }
    
    func testAdditionMethod_WhenTwoPlusButtonIsTapped_ThenShouldDisplayOnlyOnePlusMark() {
        calculator.tappedNumberButton(numberText: "1")
        calculator.tappedAdditionButton()
        calculator.tappedAdditionButton()
        XCTAssertEqual(calculator.calculText, "1 + ")
    }
    
    
}
