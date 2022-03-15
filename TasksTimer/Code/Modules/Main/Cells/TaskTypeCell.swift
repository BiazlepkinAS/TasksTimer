//
//  TaskTypeCell.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 15.03.22.
//

import UIKit

class TaskTypeCell: UICollectionViewCell {
    
    @IBOutlet var imageContainer: UIView!
    @IBOutlet var imageTypeView: UIImageView!
    @IBOutlet var typeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        DispatchQueue.main.async {
            self.imageContainer.layer.cornerRadius = self.imageContainer.bounds.width / 2
        }
        
    }
    
    
    override class func description() -> String {
        return "TaskTypeCell"
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
        self.imageTypeView.image = nil
        
    }
    
    
     func setupCell(taskType: TaskType, isSelected: Bool) {
        self.typeNameLabel.text = taskType.typeName
        
        if (isSelected) {
            self.imageContainer.backgroundColor = UIColor(hex: "82FF15").withAlphaComponent(0.8)
            self.typeNameLabel.textColor = UIColor(hex: "82FF15")
            self.imageTypeView.tintColor = UIColor.white
            self.imageTypeView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: .medium))
        }else  {
            self.imageTypeView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular))
            resetCell()
        }
    }
    
    private func resetCell() {
        self.imageContainer.backgroundColor = UIColor.clear
        self.typeNameLabel.textColor = UIColor.black
        self.imageTypeView.tintColor = UIColor.black
    }
    
    

}
