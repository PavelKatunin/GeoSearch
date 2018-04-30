import Foundation
import AsyncDisplayKit

class CompanyCell : ASCellNode {
    
    weak var titleNode: ASTextNode!
    weak var descriptionNode: ASTextNode!
    weak var imageNode: ASImageNode!
    
    static let titleAttributes = [ NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)]
    
    init(company: Company) {
        super.init()
        
        let titleNode = ASTextNode()
        
        if let companyName = company.displayName {
            titleNode.attributedText = NSAttributedString(string: companyName,
                                                          attributes: CompanyCell.titleAttributes)
        }
        
        let descriptionNode = ASTextNode()
        
        if let address = company.addresses?[0],
           let street = address.street,
           let number = address.number,
           let city = address.city {
            
            descriptionNode.attributedText = NSAttributedString(string: "\(city), \(street) \(number)")
        }
        
        let imageNode = ASImageNode()
        imageNode.image = UIImage(named: "companyIcon")
        
        self.addSubnode(imageNode)
        self.addSubnode(titleNode)
        self.addSubnode(descriptionNode)
        
        self.titleNode = titleNode
        self.imageNode = imageNode
        self.descriptionNode = descriptionNode
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let verticalStack = ASStackLayoutSpec(direction: .vertical,
                                              spacing: 8,
                                              justifyContent: .start,
                                              alignItems: .start,
                                              children: [titleNode, descriptionNode])
        
        let horizontalStack = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 8,
                                                justifyContent: .start,
                                                alignItems: .start,
                                                children: [imageNode, verticalStack])
        
        let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let insetSpec = ASInsetLayoutSpec(insets: insets, child: horizontalStack)
        
        return insetSpec
    }
    
}
