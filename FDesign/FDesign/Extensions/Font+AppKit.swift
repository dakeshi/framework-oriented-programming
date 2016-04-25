#if os(OSX)
import Foundation
import AppKit

public extension Font {
    
    func appFont() -> NSFont! {
        return NSFont(name: self.name, size: self.size)
    }
    
}
#endif