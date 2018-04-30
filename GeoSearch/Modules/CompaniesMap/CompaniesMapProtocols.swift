import Foundation
import CoreLocation

protocol CompaniesMapViewDelegate: class {
    
    func companiesMapViewDidReturn(geoSearchReuest: GeoSearchRequest, mapView: CompaniesMapViewProtocol)
    
}

protocol CompaniesMapViewProtocol: class {
    
    var delegate: CompaniesMapViewDelegate? { get set }
    
    var topLeftLocation: CLLocationCoordinate2D? { get }
    var bottomRightLocation: CLLocationCoordinate2D? { get }
    
}
