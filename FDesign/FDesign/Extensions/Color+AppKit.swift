#if os(OSX)
import Foundation
import AppKit

public extension Color {
    
    func appColor() -> NSColor! {
        return NSColor(red: CGFloat(self.red)/255.0, green: CGFloat(self.green)/255.0, blue: CGFloat(self.blue)/255.0, alpha: self.alpha)
    }
    
}
#endif