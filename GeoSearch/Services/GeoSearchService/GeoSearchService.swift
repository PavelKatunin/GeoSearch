import Foundation

enum GeoSearchError : Error {
    case parsingError
    case connectionError
}

protocol GeoSearchService {
    
    func getCompaniesList(_ searchRequest: GeoSearchRequest,
                          _ completion: @escaping (Result<[Company]>) -> Void)
    
}
