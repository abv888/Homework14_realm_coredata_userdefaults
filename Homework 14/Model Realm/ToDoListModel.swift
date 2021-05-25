//
//  ToDoListModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 05.02.2021.
//

import Foundation
import RealmSwift


class Task: Object {
    @objc dynamic var task: String = ""
    @objc dynamic var completed = false
}
    
    
