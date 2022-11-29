//
//  ProductViewController.swift
//  UIScrollView Homework
//
//  Created by Gulnaz on 22.11.2022.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productNameLabel.text = currentProduct?.name
        productPriceLabel.text = "$\(currentProduct?.price ?? 0)"
        
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width * 2, height: scrollView.frame.height)

        var imageRect = CGRect(x: 0, y: 0, width: scrollView.frame.height, height: scrollView.frame.height)
        
        let imageView1 = newImageViewWithImage(image: currentProduct!.mainImage, frame: imageRect)
        scrollView.addSubview(imageView1)
        
        imageRect.origin.x += imageRect.size.width
        let imageView2 = newImageViewWithImage(image: currentProduct!.additionalImage1!, frame: imageRect)
        scrollView.addSubview(imageView2)
        
        imageRect.origin.x += imageRect.size.width
        let imageView3 = newImageViewWithImage(image: currentProduct!.additionalImage2!, frame: imageRect)
        scrollView.addSubview(imageView3)

        
    }
    
    func newImageViewWithImage (image: UIImage, frame: CGRect) -> UIImageView {
        let result = UIImageView(frame: frame)
        result.contentMode = .scaleAspectFit
        result.image = image
        return result
    }


}
