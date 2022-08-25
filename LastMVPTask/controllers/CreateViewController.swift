//
//  CreateViewController.swift
//  LastMVPTask
//
//  Created by Avaz Mukhitdinov on 25/08/22.
//

import UIKit

class CreateViewController: UIViewController, CreateView {
    
    

    @IBOutlet weak var justLabel: UILabel!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    
    var presenter: CreatePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initViews()
    }
    
    func initViews(){
        
        presenter = CreatePresenter()
        presenter.CreateView = self
       
    }

    func createPost(post: [Post]) {}
    

   
    @IBAction func createTapped(_ sender: Any) {
        presenter?.apiPostCreate(post: Post(title: titleText.text!, body: bodyText.text!))
                                 
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
