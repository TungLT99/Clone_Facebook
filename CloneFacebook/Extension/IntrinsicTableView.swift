//
//  IntrinsicTableView.swift
//  CloneFacebook
//
//  Created by TungLT on 7/5/23.
//

import UIKit

final class IntrinsicTableView : UITableView {
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
