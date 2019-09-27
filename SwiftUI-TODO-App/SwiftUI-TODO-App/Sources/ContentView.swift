//
//  ContentView.swift
//  SwiftUI-TODO-App
//
//  Created by Yoshikazu on 2019/09/26.
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TodoListView(viewModel: TodoListViewModel())
            .navigationBarTitle(Text("SwiftUI-TODO-App"))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
