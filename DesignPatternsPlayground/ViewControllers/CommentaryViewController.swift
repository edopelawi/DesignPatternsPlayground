//
//  CommentaryViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/11/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CommentaryViewController: UIViewController {

    @IBOutlet weak var commentaryLabel: UILabel!
    
    private var commentaryTextBuffer: String?
    
    convenience init() {
        self.init(nibName: "CommentaryViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let commentary = commentaryTextBuffer {
            setCommentaryText(commentary)
        }
    }
    
    internal func setCommentaryText(commentary: String) {
        
        if commentaryLabel != nil {
            commentaryLabel.text = commentary
        } else {
            commentaryTextBuffer = commentary
        }
    }
}
