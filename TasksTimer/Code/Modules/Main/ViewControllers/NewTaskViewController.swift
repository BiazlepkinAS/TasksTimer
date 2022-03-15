//
//  NewTaskViewController.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 14.03.22.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet var closedButton: UIButton!
    @IBOutlet var taskNameTF: UITextField!
    @IBOutlet var taskDescription: UITextField!
    @IBOutlet var taskContainer: UIView!
    @IBOutlet var hoursTF: UITextField!
    @IBOutlet var minutiesTF: UITextField!
    @IBOutlet var secondsTF: UITextField!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
}
