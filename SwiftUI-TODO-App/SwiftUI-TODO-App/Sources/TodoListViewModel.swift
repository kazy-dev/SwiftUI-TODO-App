//
//  TodoListViewModel.swift
//  SwiftUI-TODO-App
//
//  Created by Yoshikazu on 2019/09/26.
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI
import Combine

class TodoListViewModel: ObservableObject {
    
    @Published var todoList: [Todo] = []
    
    func createTodo(_ todo: Todo) {
        todoList.append(todo)
    }
    
    func deleteTodo(_ todo: Todo) {
        guard let i = index(todo) else { return }
        todoList.remove(at: i)
    }
    
    func index(_ todo: Todo) -> Int? {
        guard todoList.count > 0 else { return 0 }
        return todoList.firstIndex { $0.id == todo.id }
    }
    
}
