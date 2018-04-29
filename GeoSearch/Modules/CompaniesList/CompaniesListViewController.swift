import Foundation
import AsyncDisplayKit

class CompaniesListViewController: ASViewController<ASTableNode>, CompaniesListViewProtocol {
    
    var companies: [Company] = [] {
        didSet {
            
        }
    }
    
    override init(node: ASTableNode = ASTableNode()) {
        super.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
