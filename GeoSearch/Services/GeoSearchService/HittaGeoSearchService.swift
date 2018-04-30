import Foundation

class HittaGeoSearchService : GeoSearchService {
    
    private let session: URLSession = .shared
    private let endpoint: Endpoint
    private let defaultTimeout: TimeInterval = 15
    
    //MARK: - Initializatopn
    init(_ endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    //MARK: - Public
    func getCompaniesList(_ searchRequest: GeoSearchRequest,
                          _ completion: @escaping (Result<[Company]>) -> Void) {
        
        let urlRequest = URLRequest(url: requestUrl(searchRequest),
                                    cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: defaultTimeout)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil,
                  let data = data,
                  let response = response else {
                    completion(Result.fail(GeoSearchError.connectionError))
                    return
            }
            
            let decoder = JSONDecoder()
            
                do {
                    let searchResult = try decoder.decode(GeoSearchResult.self, from: data)
                    let result: Result<[Company]>
                    
                    defer {
                        completion(result)
                    }
                    
                    guard let companies = searchResult.result?.companies?.companies else {
                        result = Result.success([])
                        return
                    }
                    
                    result = Result.success(companies)
                }
                catch {
                    completion(Result.fail(GeoSearchError.parsingError))
                }
            
            }.resume()
        
    }
    
    func requestUrl(_ searchRequest: GeoSearchRequest) -> URL {
        // append path component
        return URL(string: endpoint.endpoint + "/search/v7/app/combined/within/\(searchRequest.from.latitude)%3A\(searchRequest.from.longitude)%2C\(searchRequest.to.latitude)%3A\(searchRequest.to.longitude)/?range.to=51&range.from=1&geo.hint=\(searchRequest.hint.latitude)%3A\(searchRequest.hint.longitude)&sort.order=relevance&query=ica")!
    }
    
}
