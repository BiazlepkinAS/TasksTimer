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
        
        self.startButton.layer.cornerRadius = 15
        self.taskContainer.layer.cornerRadius = 15
        
        [self.hoursTF, self.minutiesTF, self.secondsTF].forEach {
            $0?.attributedPlaceholder = NSAttributedString(string: "00", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 55, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.black])
            $0?.delegate = self
            $0?.addTarget(self, action: #selector(Self.textFieldInputChanges(_:)), for: .editingChanged)
        }
        
        self.taskNameTF.attributedPlaceholder = NSAttributedString(string: "Task name", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5)])
        self.taskNameTF.addTarget(self, action: #selector(Self.textFieldInputChanges(_:)), for: .editingChanged)
        
        self.taskDescription.attributedPlaceholder = NSAttributedString(string: "Descriptions", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5)])
        self.taskDescription.addTarget(self, action: #selector(Self.textFieldInputChanges(_:)), for: .editingChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)

    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    @objc func textFieldInputChanges(_ texField: UITextField) {
        
        guard let text = texField.text else {return}
       
        
        if (texField == taskNameTF) {
            self.taskViewModel.setTaskName(to: text)
            
        }else if (texField == taskDescription) {
            self.taskViewModel.setTaskDescription(to: text)
            
        }else if (texField == hoursTF) {
            
            
        }else if (texField == minutiesTF) {
            
            
        }else {
            
            
        }
        
        
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
        
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
        self.collectionView.reloadSections(IndexSet(0..<1))
    }
    
}

extension NewTaskViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let maxLeight = 2
        
        let curremtText: NSString = (textField.text ?? "") as NSString
        let newString: NSString = curremtText.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLeight
        
    }
    
    
}
