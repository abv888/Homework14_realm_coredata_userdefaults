//
//  ViewController.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Stack and its Buttons
    
    let mainStackView = UIStackView()
    let aButton = UIButton()
    let bButton = UIButton()
    let cButton = UIButton()
    let dButton = UIButton()
    
    
    //MARK: - Other View Controllers
    
    
    let aVC = ATaskViewController()
    let bVC = BTaskViewController()
    let cVC = CTaskViewController()
    let dVC = DTaskViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CHOOSE TASK"
        view.backgroundColor = UIColor.lightGray
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        
        
        createButtonsStack()
        
        
    }

    
    
    
    
    
    // MARK: - Create stack
    
    
    func createButtonsStack() {
        self.view.addSubview(mainStackView
        )
        
        self.aButton.setTitle("A", for: .normal)
        self.aButton.setTitleColor(UIColor.white, for: .normal)
        self.aButton.backgroundColor = UIColor.darkGray
        self.aButton.layer.cornerRadius = 40
        
        self.bButton.setTitle("B", for: .normal)
        self.bButton.setTitleColor(UIColor.white, for: .normal)
        self.bButton.backgroundColor = UIColor.darkGray
        self.bButton.layer.cornerRadius = 40
        
        self.cButton.setTitle("C", for: .normal)
        self.cButton.setTitleColor(UIColor.white, for: .normal)
        self.cButton.backgroundColor = UIColor.darkGray
        self.cButton.layer.cornerRadius = 40
        
        self.dButton.setTitle("D", for: .normal)
        self.dButton.setTitleColor(UIColor.white, for: .normal)
        self.dButton.backgroundColor = UIColor.darkGray
        self.dButton.layer.cornerRadius = 40
        
        self.mainStackView.addArrangedSubview(aButton)
        self.mainStackView.addArrangedSubview(bButton)
        self.mainStackView.addArrangedSubview(cButton)
        self.mainStackView.addArrangedSubview(dButton)
        
        
        self.aButton.addTarget(self, action: #selector(aBUttonAction(_:)), for: .touchUpInside)
        self.bButton.addTarget(self, action: #selector(bBUttonAction(_:)), for: .touchUpInside)
        self.cButton.addTarget(self, action: #selector(cBUttonAction(_:)), for: .touchUpInside)
        self.dButton.addTarget(self, action: #selector(dBUttonAction(_:)), for: .touchUpInside)
        
       
        
        self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        self.mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        self.mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        self.mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        
        self.mainStackView.axis = .vertical
        self.mainStackView.distribution = .fillEqually
        self.mainStackView.spacing = 10
    
        self.mainStackView.backgroundColor = UIColor.lightGray
        
        
    }
    
    
    
    
    
    //MARK: - Button actions
    
    @objc func aBUttonAction(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(aVC, animated: true)
        
    }
    
    @objc func bBUttonAction(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(bVC, animated: true)
        
    }
    
    @objc func cBUttonAction(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(cVC, animated: true)
        
    }
    
    @objc func dBUttonAction(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(dVC, animated: true)
        
    }
    
    
    

}

