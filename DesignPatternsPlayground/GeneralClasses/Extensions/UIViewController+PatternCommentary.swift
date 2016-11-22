//
//  UIViewController+PatternCommentary.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/11/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Adds "Comments" right bar button with passed parameters.
    func addCommentsRightBarButton(target: AnyObject, action: Selector) {
        
        let button = UIBarButtonItem(
            title: "Comments",
            style: .plain,
            target: target,
            action: action
        )
        
        self.navigationItem.rightBarButtonItem = button
    }
    
    /// Push commentary page for passed `creationalPatternType`. Will only work if this instance has `navigationController`.
    func pushCommentaryPage(creationalPatternType: CreationalPatternType) {
        
        let commentaries = PatternCommentaryFactory.commentaryForCreationalPatternType(creationalPatternType)
        
        let commentPage = CommentaryViewController()
        commentPage.setCommentaryText(commentaries)
        
        self.navigationController?.pushViewController(commentPage, animated: true)
    }    
    
    /// Push commentary page for passed `structuralPatternType`. Will only work if this instance has `navigationController`.
    func pushCommentaryPage(structuralPatternType: StructuralPatternType) {
        
        let commentaries = PatternCommentaryFactory.commentaryForStructuralPatternType(structuralPatternType)
        
        let commentPage = CommentaryViewController()
        commentPage.setCommentaryText(commentaries)
        
        self.navigationController?.pushViewController(commentPage, animated: true)
    }
    
    /// Push commentary page for passed `behaviouralPatternType`. Will only work if this instance has `navigationController`.
    func pushCommentaryPage(behaviouralPatternType: BehaviouralPatternType) {
        
        let commentaries = PatternCommentaryFactory.commentaryForBehaviouralPatternType(behaviouralPatternType)
        
        let commentPage = CommentaryViewController()
        commentPage.setCommentaryText(commentaries)
        
        self.navigationController?.pushViewController(commentPage, animated: true)
    }
}
