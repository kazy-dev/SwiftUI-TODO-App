//
//  TodoColor.swift
//  SwiftUI-TODO-App
//
//  Created by Yoshikazu on 2019/09/26.
//  Copyright © 2019 kazy. All rights reserved.
//

import Foundation
import SwiftUI

enum TodoColor: Int, CaseIterable, Identifiable {
    
    var id: TodoColor {
        self
    }
    
    case red
    case green
    case blue
    case yellow

    var color: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .yellow: return .yellow
        }
    }

    static var `default`: TodoColor {
        return .red
    }
}
