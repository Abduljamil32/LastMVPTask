//
//  CreatePresenter.swift
//  LastMVPTask
//

import Foundation


protocol CreatePresenterProtocol{
    func apiPostCreate(post: Post)
}

class CreatePresenter: CreatePresenterProtocol{
    
    var CreateView: CreateView?

    func apiPostCreate(post: Post) {
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
}
