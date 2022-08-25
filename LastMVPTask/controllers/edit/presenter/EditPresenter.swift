//
//  EditPresenter.swift
//  LastMVPTask


import Foundation

protocol EditPresenterProtocol {
    func apiEditPost(post: Post)
}

class EditPresenter: EditPresenterProtocol{
    
    var view: EditView!
    
    func apiEditPost(post: Post){
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            switch response.result{
            case .success:
                print(response.result)
                
            case let .failure(error):
                print(error)
            }
        })
    }
    
    
}
