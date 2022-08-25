//
//  HomeView.swift
//  LastMVPTask


import Foundation


protocol HomeView{
    func LoedPosts(post: [Post])
    func DeletePost(deleted: Bool)
}
