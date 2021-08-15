//
//  TestingTextFieldsTests.swift
//  TestingTextFieldsTests
//
//  Created by Mario Alberto Barragán Espinosa on 15/08/21.
//

import XCTest
@testable import TestingTextFields

class TestingTextFieldsTests: XCTestCase {
  func test_outlets_shouldBeConnected() {
    let sut = makeSUT()
        
    XCTAssertNotNil(sut.usernameField)
    XCTAssertNotNil(sut.passwordField)
  }
  
  func test_usernameField_attributesShouldBeSet() {
    let sut = makeSUT()
    let textfield = sut.usernameField
    
    XCTAssertEqual(textfield?.textContentType, .username)
    XCTAssertEqual(textfield?.autocorrectionType, .no)
    XCTAssertEqual(textfield?.returnKeyType, .next)
  }
  
  func test_passwordField_attributesShouldBeSet() {
    let sut = makeSUT()
    let textfield = sut.passwordField
    
    XCTAssertEqual(textfield?.textContentType, .password)
    XCTAssertTrue(textfield!.isSecureTextEntry)
    XCTAssertEqual(textfield?.returnKeyType, .go)
  }
  
  func test_shouldReturn_changesFocusForUsernameAndPasswordFields() {
    let sut = makeSUT()
    putInViewHierarchy(sut)
    
    sut.usernameField.simulateReturnKeyPressed()
    XCTAssertTrue(sut.passwordField.isFirstResponder)
    
    sut.passwordField.simulateReturnKeyPressed()
    XCTAssertFalse(sut.usernameField.isFirstResponder)
    XCTAssertFalse(sut.passwordField.isFirstResponder)
  }
  
  // MARK: - Helpers
  
  private func makeSUT(file: StaticString = #file, line: UInt = #line) -> ViewController {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
    
    sut.loadViewIfNeeded()
    
    return sut
  }
  
  private func putInViewHierarchy(_ sut: ViewController) {
    let window = UIWindow()
    window.addSubview(sut.view)
  }

}

extension UITextField {
  @discardableResult
  func simulateReturnKeyPressed() -> Bool {
    delegate?.textFieldShouldReturn?(self) ?? false
  }
}
