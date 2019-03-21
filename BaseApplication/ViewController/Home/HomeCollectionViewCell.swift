//
//  HomeCollectionViewCell.swift
//  BaseApplication
//
//  Created by Hoang Anh on 3/20/19.
//  Copyright © 2019 Hoang Anh. All rights reserved.
//

import UIKit

protocol HomeCellDelegate: class {
    func didClickButton(index: Int)
}

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "HomeCollectionViewCell"

    private var index: Int = 0
    var didSelectButton: ((Int) -> Void)?
    
    @IBOutlet weak var bgView: UIView!
    
    weak var delegate: HomeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgView.layer.cornerRadius = 20.0
    }

    @IBAction func clickButtonAction(_ sender: Any) {
        //self.delegate?.didClickButton(index: self.index)
        
        if let selectButton = self.didSelectButton {
            selectButton(self.index)
        }
    }
    
    func updateContentCell(index: Int) {
        self.index = index
        let mod = index % 4
        if (mod == 1 || mod == 2) {
            self.bgView.backgroundColor = UIColor.red
        } else {
            self.bgView.backgroundColor = BaseColor.theme
        }
    }
}
