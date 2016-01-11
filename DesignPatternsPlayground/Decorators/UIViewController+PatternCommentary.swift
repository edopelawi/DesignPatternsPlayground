//
//  UIViewController+PatternCommentary.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/11/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Push commentary page for passed `creationalPatternType`. Will only work if this instance has `navigationController`.
    func pushCommentaryPage(creationalPatternType creationalPatternType: CreationalPatternType) {
        
        let commentaries = PatternCommentaryFactory.commentaryForCreationalPatternType(creationalPatternType)
        
        let commentPage = CommentaryViewController()
        commentPage.setCommentaryText(commentaries)
        
        self.navigationController?.pushViewController(commentPage, animated: true)
    }
    
}