//
//  SearchViewController.swift
//  UIScrollView Homework
//
//  Created by Gulnaz on 22.11.2022.
//

import UIKit

class SearchViewController: UIViewController {

    
    
    //MARK: OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    var productViews: [ProductPreviewView] = []

    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // отображение продуктов в базе данных
        addProductsToArray()
        addProductsViews ()  //adding view with Products to view
        
        
        scrollView.contentSize = CGSize(width: 145 * 5.5, height: 145)
        
        for product in productViews {
            scrollView.addSubview(product)
            // choise next tab as button method
            product.productButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        }

    }
    


    //MARK: METHODS
    //adding productview to scrollview
    func addProductsViews () {
        productViews += [ProductPreviewView(product: products[0], x: 0, y: 8)]
        let productWidhPlusX = Int(productViews[0].frame.width + 14)
        productViews += [ProductPreviewView(product: products[1], x: productWidhPlusX * 1, y: 8)]
        productViews += [ProductPreviewView(product: products[2], x: productWidhPlusX * 2, y: 8)]
        productViews += [ProductPreviewView(product: products[3], x: productWidhPlusX * 3, y: 8)]
        productViews += [ProductPreviewView(product: products[4], x: productWidhPlusX * 4, y: 8)]

    }
    // button methods
    @objc func touchButton (sender: UIButton) {
        let productVC = ProductViewController()
        performSegue(withIdentifier: "pushSegue", sender: sender)
//        self.navigationController?.pushViewController(productVC, animated: false)
    }
    

}

//MARK: EXTENCIONS
