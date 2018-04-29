import Foundation

protocol CompaniesMapViewDelegate: class {
    
    func companiesMapViewDidReturn(geoSearchReuest: GeoSearchRequest, mapView: CompaniesMapViewProtocol)
    
}

protocol CompaniesMapViewProtocol: class {
    
    var delegate: CompaniesMapViewDelegate? { get set }
    
}
