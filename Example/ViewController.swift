//
//  ViewController.swift
//  Example
//
//  Created by abe on 2/11/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import UIKit
import Bean

class ViewController: UIViewController, DocumentPickable {
    
    var documents: [Bean?] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    func didPickDocument(document: Bean?) {
        documents.append(document)
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func pickPressed(_ sender: Any) {
        self.pickDocuments()
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DocumentCell", for: indexPath) as! DocumentCell
        guard let document = documents[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configure(document: document)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let document = documents[indexPath.row]!
        self.presentPreview(document: document)
    }


}

