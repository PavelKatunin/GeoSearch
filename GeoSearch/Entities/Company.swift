import Foundation

struct Company : Decodable {
    
    //MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case addresses = "address"
        case displayName
    }
    
    var displayName: String?
    var addresses: [Address]?
    
}
