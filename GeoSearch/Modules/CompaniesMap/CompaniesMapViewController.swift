import Foundation
import AsyncDisplayKit

class CompaniesMapViewController : ASViewController<ASMapNode>,
                                   CompaniesMapViewProtocol,
                                   MKMapViewDelegate {
    
    var topLeftLocation: CLLocationCoordinate2D?
    var bottomRightLocation: CLLocationCoordinate2D?
    let defaultMapRegion =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.3293,
                                                                              longitude: 18.0686),
                                               span: MKCoordinateSpan(latitudeDelta: 0.3,
                                                                      longitudeDelta: 0.3))
    weak var delegate: CompaniesMapViewDelegate?
    weak var mapNode: ASMapNode?
    
    //MARK: - Initialization
    override init(node: ASMapNode = ASMapNode()) {
        super.init(node: node)
        mapNode = node
        mapNode?.isUserInteractionEnabled = true
        mapNode?.isLiveMap = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapNode?.mapView?.delegate = self
        setDefaultMapRange()
    }
    
    //MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        topLeftLocation = mapView.region.northWest
        bottomRightLocation = mapView.region.southEast
        
        guard let topLeftLocation = topLeftLocation,
              let bottomRightLocation = bottomRightLocation
        else {
            return
        }
        
        delegate?.companiesMapViewDidReturn(geoSearchReuest: GeoSearchRequest(from: topLeftLocation,
                                                                              to: bottomRightLocation,
                                                                              hint: mapView.region.center ),
                                            mapView: self)
    }
    
    //MARK: - Private
    func setDefaultMapRange() {
        mapNode?.mapView?.setRegion(defaultMapRegion, animated: false)
    }
    
}
