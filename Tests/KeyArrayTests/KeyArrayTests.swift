import XCTest
@testable import KeyArray

final class KeyArrayTests: XCTestCase {
  
  @KeyArray var models: [Model] = [
    Model(name: "hue"),
    Model(name: "jack")
  ]
  
  func testExample() throws {
    
    let name = "hue"
    
    let hue = $models[name]
    XCTAssertNotNil(hue)
  }
}
