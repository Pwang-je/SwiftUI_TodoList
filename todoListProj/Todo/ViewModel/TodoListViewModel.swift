//
//  TodoListViewModel.swift
//  todoListProj
//
//  Created by Pwang on 6/8/24.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoItem: [TodoModel] = []
    @Published var isPresented: Bool = false
    
    // 텍스트에 입력한 값을 연동시켜야 한다.
    @Published var newTodoListTitle: String = ""
    
    func removeItem(at offsets: IndexSet) {
        todoItem.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        todoItem.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleItem(item: TodoModel) {
        if let index = todoItem.firstIndex(where: {
            (originalItem) -> Bool in
            return originalItem.id == item.id
        }) {
            todoItem[index].isComplete.toggle()
        }
    }
    
    func addItem(title: String) {
        let newItem = TodoModel(title: title)
        todoItem.append(newItem)
    }
}
