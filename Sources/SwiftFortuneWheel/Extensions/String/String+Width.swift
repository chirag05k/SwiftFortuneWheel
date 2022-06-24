//
//  String+Width.swift
//  SwiftFortuneWheel-iOS
//
//  Created by Sherzod Khashimov on 6/27/20.
//  Copyright © 2020 SwiftFortuneWheel. All rights reserved.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension String {
    /// Avalilable width for text with specified font
    /// - Parameter font: Font
    /// - Returns: Text width
    func width(by font: SFWFont) -> CGFloat {
        var textWidth: CGFloat = 0

        for element in self {
            let characterString = String(element)
            if #available(iOS 11.0, *) {
                let letterSize = characterString.size(withAttributes: [.font: UIFontMetrics.default.scaledFont(for: font)])
                textWidth += letterSize.width
            } else {
                let letterSize = characterString.size(withAttributes: [.font: font])
                textWidth += letterSize.width
            }
        }
        return textWidth + 1
    }
}
