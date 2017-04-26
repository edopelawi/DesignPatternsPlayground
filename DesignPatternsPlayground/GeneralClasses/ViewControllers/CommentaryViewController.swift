//
//  CommentaryViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/11/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CommentaryViewController: UIViewController {

    @IBOutlet fileprivate weak var commentaryLabel: UILabel!
    @IBOutlet fileprivate weak var scrollView: UIScrollView!
    
    fileprivate var commentaryTextBuffer: String?
    
    convenience init() {
        self.init(nibName: "CommentaryViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Comments"
        
        if let navigationBarHeight = navigationController?.navigationBar.frame.height {
            let topContentInset = navigationBarHeight + CGFloat(20)
            scrollView.contentInset = UIEdgeInsetsMake(topContentInset, 0, 0, 0)
        }
        
        if let commentary = commentaryTextBuffer {
            setCommentaryText(commentary)
        }
    }
    
    internal func setCommentaryText(_ commentary: String) {
        
        if commentaryLabel != nil {
            commentaryLabel.text = commentary
        } else {
            commentaryTextBuffer = commentary
        }
    }
}
