//
//  ProductPreviewView.swift
//  UIScrollView Homework
//
//  Created by Gulnaz on 22.11.2022.
//

import UIKit

class ProductPreviewView: UIView {
    //MARK: OUTLETS
    // product for this view
    let product: Product
    
    // name of product
    let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica Neue", size: 13)
        return label
    }()
    // image of product
    let image: UIImage
    // button which send product to order
    let productButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 121, height: 145)
        return button
    }()
    
    //MARK: layoutSubviews, draw
    override func layoutSubviews() {
        super.layoutSubviews()
        // background style
        backgroundColor = .black
        // adding button to view
        addSubview(productButton)
        // button which send product to order
        productButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
    }
    override func draw(_ rect: CGRect) {
        // background style
        let roundRect = UIBezierPath(roundedRect: bounds, cornerRadius: 15)
        roundRect.addClip()
        UIColor.darkGray.setFill()
        roundRect.fill()
        // adding image and labels to view
        image.draw(in: bounds.zoom(by: 0.8))
        nameLabel.drawText(in: CGRect(x: bounds.minX+10, y: 145-20, width: 150, height: 10))
    }
    //MARK: METHODS
    // button which send product to order
    @objc func touchButton (sender: UIButton) {
        print("choose : \(product.identifier)")
        currentProduct = product
    }
    // correct initialisation
    init (product: Product, x: Int, y: Int) {
        self.product = product
        self.image = product.mainImage
        self.nameLabel.text = product.name
        super.init(frame: CGRect(x: x, y: y, width: 145, height: 145))
    }
    // required initialisation, not correct, but can't delete
    required init?(coder aDecoder: NSCoder) {
        self.product = Product()
        self.image = product.mainImage
        self.nameLabel.text = String(product.price)
        super.init(coder: aDecoder)
    }
}

// MARK: Extension
extension CGRect {
        func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}



