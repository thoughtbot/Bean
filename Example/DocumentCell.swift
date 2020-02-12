//
//  DocumentCell.swift
//  Example
//
//  Created by abe on 2/11/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import UIKit
import Bean

class DocumentCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        view.layer.cornerRadius = 8
    }
    
    func configure(document: Bean) {
        self.titleLabel.text = document.fileName
        imageView.image = document.thumbnail
    }
    
}

