#if os(OSX)
#else
import Foundation
import UIKit

public extension Color {
    
    func uiColor() -> UIColor! {
        return UIColor(red: CGFloat(self.red)/255.0, green: CGFloat(self.green)/255.0, blue: CGFloat(self.blue)/255.0, alpha: self.alpha)
    }
    
}
#endif