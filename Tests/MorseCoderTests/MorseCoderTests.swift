import XCTest
@testable import MorseCoder

class MorseCoderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(MorseCoder().text, "Hello, World!")
    }


    static var allTests : [(String, (MorseCoderTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
