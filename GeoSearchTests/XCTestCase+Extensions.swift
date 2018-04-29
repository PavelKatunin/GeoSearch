import Foundation
import XCTest

extension XCTestCase {
    
    func jsonDataFromFile(named name:String) -> NSData {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: name, ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)
        return jsonData!
    }
    
}
