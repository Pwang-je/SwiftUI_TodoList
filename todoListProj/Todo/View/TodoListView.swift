//
//  TodoListView.swift
//  todoListProj
//
//  Created by Pwang on 6/4/24.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("할일 목록") {
                        ForEach(viewModel.todoItem) { item in
                            if !item.isComplete {
                                HStack {
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(item.isComplete ? .green : .gray)
                                        .onTapGesture {
                                            // is Complete toggle()
                                            viewModel.toggleItem(item: item)
                                        }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                    Section("완료 목록") {
                        ForEach(viewModel.todoItem) { item in
                            if item.isComplete {
                                HStack {
                                    Text(item.title)
                                        .foregroundColor(Color(.systemGray3))
                                        .strikethrough() // 가운데 선
                                    Spacer()
                                    Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(item.isComplete ? .green : .gray)
                                        .onTapGesture {
                                            // is Complete toggle()
                                            viewModel.toggleItem(item: item)
                                        }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                }
                
                .listStyle(PlainListStyle()) // 전체 배경화면 색상 변경
                
                
                Button("생성하기") {
                    viewModel.isPresented.toggle()
                }
                .frame(width: 200, height: 30)
                .padding()
                .foregroundColor(Color(.white))
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .sheet(isPresented: $viewModel.isPresented) {
                    NewTodoListView(viewModel: viewModel)
                }
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: EditButton())
        }
        .padding()
    }
}

#Preview {
    TodoListView()
}
