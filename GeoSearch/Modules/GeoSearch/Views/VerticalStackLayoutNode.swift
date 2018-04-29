import Foundation
import AsyncDisplayKit

class VerticalStackLayoutNode: ASDisplayNode {
    
    weak var topNode: ASDisplayNode? {
        didSet {
            addSubnode(topNode!)
            setNeedsLayout()
            view.setNeedsUpdateConstraints()
        }
    }
    
    weak var bottomNode: ASDisplayNode? {
        didSet {
            addSubnode(bottomNode!)
            setNeedsLayout()
            view.setNeedsUpdateConstraints()
        }
    }
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.gray
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let stack = ASStackLayoutSpec(direction: .vertical,
                                      spacing: 0,
                                      justifyContent: .start,
                                      alignItems: .center,
                                      children: [topNode!, bottomNode!])
        
        return stack
    }
    
}
