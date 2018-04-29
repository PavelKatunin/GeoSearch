import Foundation

// Use only for async results, for sync use throwing
enum Result <SuccessType> {
    case success(SuccessType)
    case fail(Error)
}
