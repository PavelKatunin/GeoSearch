import Foundation

class GeoSearchInteractor : GeoSearchInteractorProtocol {
    
    private let geoSearchService: GeoSearchService
    
    func getCompaniesList(_ searchRequest: GeoSearchRequest, completion: @escaping (Result<[Company]>) -> Void) {
        geoSearchService.getCompaniesList(searchRequest, completion)
    }
    
    init(_ geoSearchService: GeoSearchService) {
        self.geoSearchService = geoSearchService
    }
    
}
