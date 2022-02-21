//
//  FlagImageViewController.swift
//  FlagsApp
//
//  Created by Alex Paramonov on 21.02.22.
//

import UIKit

class FlagImageViewController: UIViewController {

     @IBOutlet weak var imageView: UIImageView!
     var imageName: String = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
         setImage()
         setRightShareButton()
         navigationItem.largeTitleDisplayMode = .never
    }
     
     private func setImage() {
          imageView.image = UIImage(named: imageName)
     }
     private func setRightShareButton() {
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
     }
     @objc func shareTapped() {
          guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
               print("Image not Found")
               return
          }
     
          let viewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
          viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
          present(viewController, animated: true)
          
     }
}
