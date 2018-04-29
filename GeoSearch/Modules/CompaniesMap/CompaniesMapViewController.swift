import Foundation
import AsyncDisplayKit

class CompaniesMapViewController : ASViewController<ASMapNode>, CompaniesMapViewProtocol {
    
    weak var delegate: CompaniesMapViewDelegate?
    weak var mapNode: ASMapNode?
    
    override init(node: ASMapNode = ASMapNode()) {
        super.init(node: node)
        mapNode = node
        mapNode?.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
