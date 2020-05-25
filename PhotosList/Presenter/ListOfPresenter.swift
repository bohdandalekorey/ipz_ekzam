//
//  ListOfPhotosPresenter.swift
//  Photos
//
//  Created by admin on 25.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Photos

class ListOfPhotosPresenter: NSObject {

    unowned let view: ListOfPhotosProtocol!
    
    
    var myPhotos: [PhotoModel]!
    var reusableIdentifier = "PhotoCell"
    
    init(withView view: ListOfPhotosProtocol) {
        self.view = view
        
        self.myPhotos = [PhotoModel]()
        
        super.init()
        
        self.fetchPhotos() 
    }
    
    //MARK: - Private
    
    func getAssets(fromCollection collection: PHAssetCollection) -> PHFetchResult<PHAsset> {
      let photosOptions = PHFetchOptions()
      photosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
      photosOptions.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)

      return PHAsset.fetchAssets(in: collection, options: photosOptions)
    }
    
    func fetchPhotos() -> Void {
        let albumList = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: nil)
        
        albumList.enumerateObjects { (coll, _, _) in
            let result = self.getAssets(fromCollection: coll)
            for i in 0..<result.count {
                PHCachingImageManager.default().requestImage(for: result[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: nil) { (image, _) in
                    let photoModel = PhotoModel(photo: image!, name: "\(i)")
                    self.myPhotos.append(photoModel)
                   }
            }
        }
    }
    
    //MARK: - Public
    
    func getNameOfPhoto(atIndex index: Int) -> String {
        return self.myPhotos[index].name
    }
    
    func preparePush(atIndex index: Int) -> Void {
        RouterService.shared.presentImage(WithModel: self.myPhotos[index])
    }
    
}
