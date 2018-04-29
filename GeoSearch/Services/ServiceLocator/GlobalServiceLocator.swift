import Foundation

class GlobalServiceLocator: ServiceLocator {
    
    var geoSearchService: GeoSearchService
    var endpoint: Endpoint
    
    static public private(set) var sharedInstance: ServiceLocator = GlobalServiceLocator()
    
    private init() {
        self.endpoint = ProductionEndpoint()
        self.geoSearchService = HittaGeoSearchService(self.endpoint)
    }
    
    static func inject(serviceLocator: ServiceLocator) {
        self.sharedInstance = serviceLocator
    }
    
}
