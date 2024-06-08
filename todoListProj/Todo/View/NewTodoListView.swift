//
//  NewTodoListView.swift
//  todoListProj
//
//  Created by Pwang on 6/4/24.
//

import SwiftUI

struct NewTodoListView: View {
    
    @StateObject var viewModel: TodoListViewModel
    @State private var newTodoListTitle: String = ""

    var body: some View {
        VStack {
            Text("새로운 할일을 추가해 보세요")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading) {
                Text("새로운 할 일")
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray))
                TextField("", text: $newTodoListTitle)
                    .frame(width: 300, height: 20)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
            }
            .padding([.top], 30)
            
            Button("완료") {
                viewModel.addItem(title: newTodoListTitle)
                newTodoListTitle = ""
                viewModel.isPresented.toggle()
                
            }
            .frame(minWidth: 200, minHeight: 30)
            .padding()
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.top], 50)
        .background(Color(.systemGray6))	
    }
}

//#Preview {
//    NewTodoListView()
//}
