//
//  PictureView.swift
//  Pictures
//
//  Created by Tim Grinev on 10.02.2021.
//

import UIKit

class PictureView: UIView {
     
    private var titelLabel = UILabel()
    private var imageView = UIImageView()
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.addSubview(self.titelLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titelLabel.frame.origin = CGPoint(x: 16, y: 16)
        self.titelLabel.sizeToFit()
        self.imageView.frame = self.frame
    }
    
    func update(with viewModel: PictureViewModel) {
        self.titelLabel.text = viewModel.title
        self.imageView.image = UIImage(named: viewModel.imageName)
        self.setNeedsLayout()
        
    }
    
}
