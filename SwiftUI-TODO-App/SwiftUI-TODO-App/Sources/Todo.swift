//
//  Todo.swift
//  SwiftUI-TODO-App
//
//  Created by Yoshikazu on 2019/09/26.
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI
import Combine

class Todo: ObservableObject, Identifiable {
    
    let id: UUID = UUID()

    @Published var text: String
    @Published var color: TodoColor
    
    init(text: String, color: TodoColor = TodoColor.default) {
        self.text = text
        self.color = color
    }
}
