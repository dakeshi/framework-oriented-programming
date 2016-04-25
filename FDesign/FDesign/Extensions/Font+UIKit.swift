#if os(OSX)
#else
import Foundation
import UIKit
    
public extension Font {
    
    func uiFont() -> UIFont! {
        return UIFont(name: self.name, size: self.size)
    }
    
}
    
#endif