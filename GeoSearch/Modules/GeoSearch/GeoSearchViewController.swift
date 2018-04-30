import Foundation
import AsyncDisplayKit

class GeoSearchViewController: ASViewController<ASDisplayNode>,
                               GeoSearchViewProtocol,
                               CompaniesMapViewDelegate {
    
    var geoSearchInteractor: GeoSearchInteractorProtocol
    
    weak var companiesListView: CompaniesListViewController?
    weak var companiesMapView: CompaniesMapViewController?
    
    var companies: [Company] = [] {
        didSet {
            companiesListView?.companies = companies
        }
    }
    
    //MARK: - Initialization
    override init(node: ASDisplayNode = ASDisplayNode()) {
        geoSearchInteractor = GeoSearchInteractor(GlobalServiceLocator.sharedInstance.geoSearchService)
        super.init(node: node)
        
        let companiesListViewController = CompaniesListViewController()
        addChildViewController(companiesListViewController)
        companiesListViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(companiesListViewController.view)
        self.node.addSubnode(companiesListViewController.node)
        companiesListViewController.node.style.preferredSize = CGSize(width: 100, height: 100)
        companiesListView = companiesListViewController
        companiesListViewController.didMove(toParentViewController: self)
        
        
        let companiesMapViewController = CompaniesMapViewController()
        addChildViewController(companiesMapViewController)
        companiesMapViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(companiesMapViewController.view)
        self.node.addSubnode(companiesMapViewController.node)
        companiesMapView = companiesMapViewController
        companiesMapView?.delegate = self
        companiesMapViewController.didMove(toParentViewController: self)
        
        self.node.layoutSpecBlock = { node, constrainedSize in
            return ASStackLayoutSpec(direction: .vertical,
                                     spacing: 0,
                                     justifyContent: .start,
                                     alignItems: .start,
                                     children: [companiesListViewController.node, companiesMapViewController.node])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private
    //Workaround  https://github.com/facebookarchive/AsyncDisplayKit/issues/2085
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        companiesListView?.traitCollectionDidChange(previousTraitCollection)
        companiesMapView?.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        companiesMapView?.view.frame = CGRect(x: 0,
                                               y: 0,
                                               width: view.bounds.width,
                                               height: view.bounds.height / 2)
        companiesMapView?.view.setNeedsLayout()
        companiesListView?.view.frame = CGRect(x: 0,
                                              y: view.bounds.height / 2,
                                              width: view.bounds.width,
                                              height: view.bounds.height / 2)
        companiesListView?.view.setNeedsLayout()
    }
    
    //MARK: - CompaniesMapViewDelegate
    func companiesMapViewDidReturn(geoSearchReuest: GeoSearchRequest, mapView: CompaniesMapViewProtocol) {
        self.geoSearchInteractor.getCompaniesList(geoSearchReuest) { result in
            
            switch result {
            case .success(let companies):
                self.companiesListView?.companies = companies
                print(companies)
            case .fail(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
