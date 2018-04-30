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
        return URL(string: endpoint.endpoint + "search/v7/app/combined/within/57.840703831916%3A11.728156448084002%2C57.66073920808401%3A11.908121071915998/?range.to=51&range.from=1&geo.hint=57.75072152%3A11.81813876&sort.order=relevance&query=ica")!
    }
    
}
