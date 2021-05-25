//
//  ATaskViewController.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 28.01.2021.
//

import UIKit





class ATaskViewController: UIViewController {
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var nameTextField = UITextField()
    var surnameTextField = UITextField()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Task A"
        view.backgroundColor = UIColor.lightGray
        
        createTextField(field: nameTextField, placeholderText: "Name", top: 150, left: 30, right: -30, equalView: self.view)
        createTextField(field: surnameTextField, placeholderText: "Surname", top: 100, left: 30, right: -30, equalView: nameTextField)
        
        self.nameTextField.delegate = self
        self.surnameTextField.delegate = self
        
        nameTextField.text = UserDefaults.standard.string(forKey: UDKeys.nameKey)
        surnameTextField.text = UserDefaults.standard.string(forKey: UDKeys.surnameKey)
        
        
        
    
        
    }
    
    
// MARK: - TextField creation method
    

    func createTextField(field: UITextField, placeholderText: String?, top: CGFloat, left: CGFloat, right: CGFloat, equalView: UIView) {
        
        self.view.addSubview(field)
    
        field.textColor = UIColor.black
        field.backgroundColor = UIColor.white
        
        field.translatesAutoresizingMaskIntoConstraints = false
         
        field.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        field.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        field.rightAnchor.constraint(equalTo: view.rightAnchor, constant: right).isActive = true
        field.placeholder = placeholderText ?? "Введите текст"
        
        field.layer.cornerRadius = 8
        
    }
    
    
    
}



// MARK: - UITextFieldDelegate method


extension ATaskViewController: UITextFieldDelegate {
    
    func  textFieldDidEndEditing(_ textField: UITextField) {
        
        
        UserDefaultsPersistance.shared.nameUD = nameTextField.text
        UserDefaultsPersistance.shared.surnameUD = surnameTextField.text
        
       
    
    
    }
    
    
}
