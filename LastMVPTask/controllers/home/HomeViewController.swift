//
//  HomeViewController.swift
//  LastMVPTask


import UIKit

class HomeViewController: BaseViewController, HomeView, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: HomePresenter!
    @IBOutlet weak var tableView: UITableView!
    var items: Array<Post> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initViews()
    }
    
    // MARK: - Methods
    
    
    func LoedPosts(post: [Post]) {
        if post.count > 0 {
            resfreshTableView(posts: post)
        }else{
//            error
        }
    }
    
    func DeletePost(deleted: Bool) {
        if deleted {
            presenter.apiPostList()
        }else{
//            error
        }
    }
    
    func resfreshTableView(posts: [Post]){
        self.items = posts
        self.tableView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    func initViews() {
        tableView.dataSource = self
        tableView.delegate = self
        
        initNavs()
    
        presenter = HomePresenter()
        presenter.homeView = self
        presenter.apiPostList()
        
    }

    func initNavs() {
        let refresh = UIImage(systemName: "arrow.clockwise")
        let add = UIImage(systemName: "plus")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: refresh, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
        title = "Posts"
    }
    
    func callCreateViewcontroller(){
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func callEditViewController(post: Post){
        let vc = EditViewController(nibName: "EditViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
        vc.editPost = post
    }

    // MARK: -- Actions
    
    @objc func leftTapped() {
        presenter.apiPostList()
    }
    
    @objc func rightTapped() {
        callCreateViewcontroller()
    }
    
    // MARK: -- Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let item = items[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as! PostTableViewCell
        
        cell.titleLabel.text = item.title
        cell.bodyLabel.text = item.body
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeCompleteContextualAction(forRowAt: indexPath, post: items[indexPath.row])
        ])
    }
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeDeleteContextualAction(forRowAt: indexPath, post: items[indexPath.row])
        ])
    }
   
    // MARK: Contextual ACtions
    
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath, post: Post)-> UIContextualAction{
        return UIContextualAction(style: .normal, title: "Delete") { (action, swipeButtonView, completion) in
            print("Delete Here")
            
            completion(true)
            self.presenter.apiPostDelete(post: post)
        }
    }
    
    
    private func makeCompleteContextualAction(forRowAt indexPath: IndexPath, post: Post)-> UIContextualAction{
        return UIContextualAction(style: . normal, title: "Edit") { (action, swipeButtonView, completion) in
            print("Complete Here")
            
            completion(true)
            self.callEditViewController(post: post)
        }
    }

}
