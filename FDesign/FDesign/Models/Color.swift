import Foundation
#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

public struct Color {
    
    // MARK: - Attributes
    
    internal let red: Int
    internal let green: Int
    internal let blue: Int
    internal let alpha: CGFloat
    
    
    // MARK: - Init
    
    public init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
}