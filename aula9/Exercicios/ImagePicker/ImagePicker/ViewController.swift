//
//  ViewController.swift
//  ImagePicker
//
//  Created by InfraCWI on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    private var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, info: [String : AnyObject]!) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.addImageToCollection(image)
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func galleryAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func addImageToCollection(_ image: UIImage) {
        self.images.append(image)
        self.collectionView.reloadData()
        print("image added to collection")
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                      for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.black
        if (self.images.count > indexPath.row) {
            cell.setImage(self.images[indexPath.row])
        }
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let padding =  50
        let collectionViewSize = self.collectionView.frame.size.width.subtracting(CGFloat(padding))
        let halfSize = collectionViewSize.divided(by: CGFloat(2))
        return CGSize(width: halfSize, height: halfSize)
        
    }

    


}

