import Foundation

protocol ServiceLocator {
    
    var geoSearchService: GeoSearchService { get }
    var endpoint: Endpoint {get}
    
}
