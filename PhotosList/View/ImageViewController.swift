//
//  ImageViewController.swift
//  PhotosList
//
//  Created by admin on 25.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol PhotoProtocol: class {
    
}

class PhotoViewController: UIViewController, PhotoProtocol {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    var presenter: ImagePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.icon.image = self.presenter.getImage()
        self.titleText.text = self.presenter.getTitle()
    }

}
