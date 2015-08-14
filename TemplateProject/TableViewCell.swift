//
//  TableViewCell .swift
//  TemplateProject
//
//  Created by Jahvon on 8/12/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import Foundation
import UIKit
import ParseUI

class TableViewCell : PFTableViewCell {
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var messageField: UILabel!
    @IBOutlet weak var textView: UILabel!
          override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //arranging the view 
    }
}


