import Foundation
import AsyncDisplayKit

class CompaniesListViewController: ASViewController<ASTableNode>,
                                   CompaniesListViewProtocol,
                                   ASTableDataSource {
    
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
        self.tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    //MARK: - ASTableDataSource
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        return {
            return CompanyCell(company: self.companies[indexPath.row])
        }
    }
    
}
