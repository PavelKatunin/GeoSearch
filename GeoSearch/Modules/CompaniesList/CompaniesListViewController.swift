import Foundation
import AsyncDisplayKit

class CompaniesListViewController: ASViewController<ASTableNode>, CompaniesListViewProtocol {
    
    var companies: [Company] = [] {
        didSet {
            
        }
    }
    
}
