//
//  EditViewController.swift
//  LastMVPTask


import UIKit

class EditViewController: UIViewController, EditView {

    @IBOutlet weak var justTitle: UILabel!
    @IBOutlet weak var newTitleText: UITextField!
    @IBOutlet weak var newBodyText: UITextField!
    
    var posts : Post = Post()
    var PostID: String = "1"
    var presenter: EditPresenter!
    var editPost: Post?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initViews()
    }


    func initViews()  {
    
        newTitleText.text = editPost?.title
        newBodyText.text = editPost?.body
        
        presenter = EditPresenter()
        presenter.view = self
        
    }

    func apiPostEdit(post: [Post]) {
        if post != nil {
            self.posts = editPost!
        }
    }

    @IBAction func editTapped(_ sender: Any) {
        let post1 = Post(id: (editPost?.id!)!, title: newTitleText.text!, body: newBodyText.text!)
        presenter?.apiEditPost(post: post1)
        
        dismiss(animated: true, completion: nil)
    }
}
