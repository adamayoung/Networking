@testable import Networking
import XCTest

final class HTTPMethodTests: XCTestCase {

    func testName_whenGET() {
        let method = HTTPMethod.get()
        let expectedResult = "GET"

        let result = method.name

        XCTAssertEqual(result, expectedResult)
    }

    func testName_whenPUT() {
        let method = HTTPMethod.put(nil)
        let expectedResult = "PUT"

        let result = method.name

        XCTAssertEqual(result, expectedResult)
    }

    func testName_whenPOST() {
        let method = HTTPMethod.post(nil)
        let expectedResult = "POST"

        let result = method.name

        XCTAssertEqual(result, expectedResult)
    }

    func testName_whenDELETE() {
        let method = HTTPMethod.delete
        let expectedResult = "DELETE"

        let result = method.name

        XCTAssertEqual(result, expectedResult)
    }

    func testName_whenHEAD() {
        let method = HTTPMethod.head
        let expectedResult = "HEAD"

        let result = method.name

        XCTAssertEqual(result, expectedResult)
    }

}
