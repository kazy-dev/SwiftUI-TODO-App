//
//  TodoList.swift
//  SwiftUI-TODO-App
//
//  Created by Yoshikazu on 2019/09/26.
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel: TodoListViewModel
    
    @State private var draftTitle: String = ""
    @State private var selectedColor: TodoColor = TodoColor.default
    @State private var isDone: Bool = true
    
    init(viewModel: TodoListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16.0) {
                HStack(alignment: .top) {
                    TextField("Create a New Task...", text: $draftTitle)
                    Image(systemName: "plus.circle").imageScale(.large)
                        .onTapGesture {
                            guard !self.draftTitle.isEmpty else {
                                return
                            }
                            let todo = Todo.init(text: self.draftTitle, color: self.selectedColor)
                            self.viewModel.createTodo(todo)
                            self.draftTitle = ""
                    }
                }
                HStack {
                    ForEach(TodoColor.allCases) { c in
                        Image(systemName: c == self.selectedColor ? "circle.fill" : "circle")
                            .foregroundColor(c.color)
                            .onTapGesture { self.selectedColor = c }
                    }
                }
                ScrollView {
                    ForEach(viewModel.todoList) { todo in
                        HStack {
                            Text(todo.text)
                            Spacer()
                            Image(systemName: "trash.fill").imageScale(.large)
                                .disabled(false)
                                .onTapGesture {
                                    print("タップ!")
                                    self.viewModel.deleteTodo(todo)
                            }
                        }
                        .padding()
                        .background(todo.color.color)
                        .cornerRadius(20.0)
                    }
                }
            }.padding()
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    struct TodoList_Previews: PreviewProvider {
        static var previews: some View {
            TodoListView(viewModel: TodoListViewModel())
        }
    }
}
