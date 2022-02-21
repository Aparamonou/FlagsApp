//
//  ViewController.swift
//  FlagsApp
//
//  Created by Alex Paramonov on 21.02.22.
//

import UIKit

class ViewController: UITableViewController {

     var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
     
     override func viewDidLoad() {
          super.viewDidLoad()
          setTitle()
          setRightBarButton() 
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          countries.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
          cell.textLabel?.text = countries[indexPath.row]
          cell.imageView?.image = UIImage(named: countries[indexPath.row])
          return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
          guard let viewCoontroller = storyboard?.instantiateViewController(withIdentifier: "FlagImageViewController") as? FlagImageViewController else {return}
          viewCoontroller.imageName = countries[indexPath.row]
          navigationController?.pushViewController(viewCoontroller, animated: true)
     }
     
     private func setTitle(){
          title = "Country choice"
          navigationController?.navigationBar.prefersLargeTitles = true
     }
     
     private func setRightBarButton() {
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
     }
     
     @objc func sharedTapped() {
          let message = " This is a nice app"
          let viewController = UIActivityViewController(activityItems: [message], applicationActivities: [])
          viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
          present(viewController, animated: true)
     }
     
}

