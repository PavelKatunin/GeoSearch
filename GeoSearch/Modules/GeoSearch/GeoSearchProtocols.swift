import Foundation

protocol GeoSearchViewProtocol : class {
    
    var companies : [Company] { get set }
    
}

protocol GeoSearchInteractorProtocol : class {

    func getCompaniesList(_ searchRequest: GeoSearchRequest, completion: @escaping (Result<[Company]>) -> Void)
    
}
