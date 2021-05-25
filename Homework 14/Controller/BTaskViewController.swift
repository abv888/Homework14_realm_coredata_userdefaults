//
//  BTaskViewController.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 28.01.2021.
//

import UIKit
import RealmSwift

class BTaskViewController: UITableViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder)  {
        fatalError("init(coder:) has not been implemented")
    }

    
    
             
    let cellID = "ToDoCell"
    
    
    var realm: Realm!
    
    var toDoList: Results<Task> {
        get {
            return realm.objects(Task.self)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Task B"
        view.backgroundColor = UIColor.lightGray
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton(_:)))
        
        
        
        realm = try! Realm()
        
    }
    
    
    
    //MARK: - Add Method

    
    @objc func addButton(_ sender: Any) {
        
        
        let alertVC = UIAlertController(title: "Новое дело!", message: "Что Вам нужно сделать?", preferredStyle: .alert)
        
        alertVC.addTextField { (UITextField) in}
        
        
        let cancelAction = UIAlertAction.init(title: "Отмена", style: .destructive, handler: nil)
        alertVC.addAction(cancelAction)
        
        let addAction = UIAlertAction.init(title: "Добавить", style: .default) { (UIAlertAction) -> Void in
            let toDoTextField = (alertVC.textFields?.first)! as UITextField
            
            
            let newTask = Task()
            newTask.task = toDoTextField.text!
            newTask.completed = false
            
            try! self.realm.write({
                self.realm.add(newTask)
                
                self.tableView.insertRows(at: [IndexPath.init(row: self.toDoList.count - 1, section: 0)], with: .automatic)
            })
        }
        
        alertVC.addAction(addAction)
        present(alertVC, animated: true, completion: nil)
        
        self.tableView.reloadData()
        
    }

    
    
    
    
    
    //MARK: - DataSource and Delegate methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        
        let currentTask = toDoList[indexPath.row]
        cell.textLabel?.text = currentTask.task
        
        cell.accessoryType = currentTask.completed == true ? .checkmark : .none
        
        return cell
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            let currentTask = toDoList[indexPath.row]
            try! self.realm.write({
                self.realm.delete(currentTask)
            })
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentTask = toDoList[indexPath.row]
        
        try! self.realm.write({
            currentTask.completed = !currentTask.completed
        })
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    
    
    
    
    
}
