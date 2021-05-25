//
//  CTaskViewController.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 28.01.2021.
//

import UIKit
import CoreData

class CTaskViewController: UITableViewController {
    
    
    let cellCDID = "CoreDataCell"
    
    var tasks = [Tasks]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadTasksCD()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Task C"
        view.backgroundColor = UIColor.lightGray
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellCDID)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButton))

        
    }
    

    
    
    @objc func addTaskButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Новое дело!", message: "Что Вам нужно сделать?", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Отмена", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        
        let addAction = UIAlertAction.init(title: "Добавить", style: .default) { (UIAlertAction) -> Void in
            let toDoTextField = (alertController.textFields?.first)! as UITextField
            
            let newTask = Tasks(context: self.context)
            newTask.item = toDoTextField.text!
            self.tasks.append(newTask)
            self.saveTaskToCD()
            
        }
        
        alertController.addTextField { _ in}
        alertController.addAction(addAction)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    func saveTaskToCD() {
        
        do {
            try context.save()
        } catch  {
            print("Error saving - \(error)")
        }
        self.tableView.reloadData()
        //print("____________saved______________")
    }
    
    func loadTasksCD() {
        let request: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            tasks = try context.fetch(request)
        } catch {
            print("Error fetching - \(error)")
        }
        //print("____________loaded______________")
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellCDID, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        let newTask2 = tasks[indexPath.row]
        cell.textLabel?.text = newTask2.item
        cell.accessoryType = newTask2.isCompleted ? .checkmark : .none
        
        
        return cell
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        tasks[indexPath.row].isCompleted = !tasks[indexPath.row].isCompleted
        saveTaskToCD()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let item = tasks[indexPath.row]
            tasks.remove(at: indexPath.row)
            context.delete(item)
            
            do {
                try context.save()
            } catch {
                print("Delete error - \(error)")
            }
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
