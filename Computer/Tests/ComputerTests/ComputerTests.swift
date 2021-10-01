import XCTest
@testable import Computer

final class ComputerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Computer().text, "Hello, World!")
    }
}
