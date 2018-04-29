import XCTest

@testable import GeoSearch

class ParsingTests: XCTestCase {
    
    func testGeoSearchResultParsing() {
        let jsonData = jsonDataFromFile(named: "geoSearchResult")
        
        XCTAssertNotNil(jsonData)
        
        var searchResult: GeoSearchResult?
        
        do {
            searchResult = try JSONDecoder().decode(GeoSearchResult.self, from: jsonData as Data)
        }
        catch {
            print("caught: \(error)")
            XCTFail("Parsing error")
        }
        
        XCTAssertNotNil(searchResult?.result?.companies?.companies)
        
        guard let companies = searchResult?.result?.companies?.companies else { return }
        
        XCTAssertEqual(companies.count, 51)
        XCTAssertEqual(companies[0].displayName, "Maxi ICA Stormarknad")
    }
    
}
