//
//  RouterService.swift
//  Photos
//
//  Created by admin on 25.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit


import UIKit

class RouterService: NSObject {
    
    static let shared = RouterService()
    let navigationController: UINavigationController
    
    private override init() {
        self.navigationController = UINavigationController()
        
        super.init()
        
        self.prepareUINavigationController(navigationController: self.navigationController)
    }
    
    //MARK: - Private
    
    private func prepareUINavigationController(navigationController: UINavigationController) -> Void {
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.barTintColor = UIColor(red: 10.0 / 255.0, green: 132.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        navigationController.navigationBar.tintColor = UIColor.white
    }
    
    //MARK: - Public
    
    func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier)
    }
    
    func pushListPhotosViewController() -> Void {
        let listOfPhotosVC =
            self.getViewController(withIdentifier: NSStringFromClass(ListOfPhotoViewController.self)) as! ListOfPhotoViewController
        listOfPhotosVC.presenter = ListOfPhotosPresenter(withView: listOfPhotosVC)
        
        self.navigationController.pushViewController(listOfPhotosVC, animated: true)
    }
    
    func presentImage(WithModel model: PhotoModel) -> Void {
        let imageVC =  self.getViewController(withIdentifier: NSStringFromClass(PhotoViewController.self)) as! PhotoViewController
        imageVC.presenter = ImagePresenter(withView: imageVC, photoModel: model)
        
        self.navigationController.pushViewController(imageVC, animated: true)
    }
    
}

