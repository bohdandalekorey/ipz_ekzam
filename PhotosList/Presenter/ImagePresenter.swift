//
//  ImagePresenter.swift
//  PhotosList
//
//  Created by admin on 25.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ImagePresenter: NSObject {

    
    unowned let view: PhotoProtocol!
    
    var photo: PhotoModel
    var title = "Workouts"
    var reusableIdentifier = "PhotoCell"
    
    init(withView view: PhotoProtocol, photoModel: PhotoModel) {
        self.view = view
        self.photo = photoModel
        
        super.init()
    }
    
    func getImage() -> UIImage {
        //Потрібно було представити UIImage в виді Data
        return self.photo.photo
    }
    
    func getTitle() -> String {
        return "[" + self.photo.name + "]"
    }
    
}
