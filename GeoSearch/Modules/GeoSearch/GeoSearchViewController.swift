import Foundation
import AsyncDisplayKit

class GeoSearchViewController: ASViewController<ASDisplayNode>, GeoSearchViewProtocol {
    
    var geoSearchInteractor: GeoSearchInteractorProtocol
    
    weak var companiesListView: CompaniesListViewProtocol?
    
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
        view.addSubview(companiesListViewController.view)
        node.addSubnode(companiesListViewController.node)
        companiesListViewController.didMove(toParentViewController: self)
    }
    
    //MARK: - Private
    
}
