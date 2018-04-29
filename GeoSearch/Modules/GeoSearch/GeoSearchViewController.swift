import Foundation
import AsyncDisplayKit

class GeoSearchViewController: ASViewController<ASDisplayNode>, GeoSearchViewProtocol {
    
    var geoSearchInteractor: GeoSearchInteractorProtocol
    
    weak var companiesListView: CompaniesListViewProtocol?
    weak var companiesMapView: CompaniesMapViewProtocol?
    
    var companies: [Company] = [] {
        didSet {
            companiesListView?.companies = companies
        }
    }
    
    //MARK: - Initialization
    override init(node: ASDisplayNode = ASDisplayNode()) {
        geoSearchInteractor = GeoSearchInteractor(GlobalServiceLocator.sharedInstance.geoSearchService)
        super.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View life cycle
    override func viewDidLoad() {

        let companiesListViewController = CompaniesListViewController()
        addChildViewController(companiesListViewController)
        companiesListViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(companiesListViewController.view)
        self.node.addSubnode(companiesListViewController.node)
        companiesListView = companiesListViewController
        companiesListViewController.didMove(toParentViewController: self)
        
        
        let companiesMapViewController = CompaniesMapViewController()
        addChildViewController(companiesMapViewController)
        companiesMapViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(companiesMapViewController.view)
        self.node.addSubnode(companiesMapViewController.node)
        companiesMapView = companiesMapViewController
        companiesMapViewController.didMove(toParentViewController: self)
        
        self.node.layoutSpecBlock = { node, constrainedSize in
            return ASStackLayoutSpec(direction: .vertical,
                                     spacing: 0,
                                     justifyContent: .start,
                                     alignItems: .start,
                                     children: [companiesListViewController.node, companiesMapViewController.node])
        }
        
    }
    
}
