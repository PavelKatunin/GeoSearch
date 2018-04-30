import Foundation
import CoreLocation

struct GeoSearchRequest {
    
    let from: CLLocationCoordinate2D
    let to: CLLocationCoordinate2D
    
    let hint: CLLocationCoordinate2D
    
}
