import Foundation

struct CompaniesLsit : Decodable {
    
    //MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case companies = "company"
    }
    
    let companies: [Company]?
}
