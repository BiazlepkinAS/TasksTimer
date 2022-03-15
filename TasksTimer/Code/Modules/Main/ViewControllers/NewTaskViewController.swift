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
    
    var taskViewModel: TaskViewModel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskViewModel = TaskViewModel()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: TaskTypeCell.description(), bundle: .main), forCellWithReuseIdentifier: TaskTypeCell.description())
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
}

extension NewTaskViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskViewModel.getTaskType().count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let coloms: CGFloat = 3.75
        let width: CGFloat = collectionView.frame.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let adjustWidth = width - (flowLayout.minimumLineSpacing * (coloms - 1))
        return CGSize(width: adjustWidth / coloms, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskTypeCell.description(), for: indexPath) as! TaskTypeCell
        
        cell.setupCell(taskType: self.taskViewModel.getTaskType()[indexPath.item], isSelected: taskViewModel.getSelectedIndex() == indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.taskViewModel.setSelectedIndex(to: indexPath.item)
    }
    
}
