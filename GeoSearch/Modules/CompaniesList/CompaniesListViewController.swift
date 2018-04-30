import Foundation
import AsyncDisplayKit

class CompaniesListViewController: ASViewController<ASTableNode>,
                                   CompaniesListViewProtocol {
    
    weak var tableNode: ASTableNode!
    
    var companies: [Company] = [] {
        didSet {
            tableNode.reloadData()
        }
    }
    
    //MARK: - Initialization
    override init(node: ASTableNode = ASTableNode()) {
        super.init(node: node)
        self.tableNode = node
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
}
