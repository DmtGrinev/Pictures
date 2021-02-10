//
//  PictureCell.swift
//  Pictures
//
//  Created by Tim Grinev on 10.02.2021.
//

import UIKit


class PictureCell<T: UIView>: UICollectionViewCell {

    let containerView: T

    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super.init(frame: frame)
        self.contentView.addSubview(self.containerView)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
    }
}
