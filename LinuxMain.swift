import XCTest

import BeanTests

var tests = [XCTestCaseEntry]()
tests += BeanTests.allTests()
XCTMain(tests)
