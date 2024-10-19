//
//  ProductsViewController.swift
//  ShoppingList
//
//  Created by Diplomado on 12/10/24.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var item1 : Item!
    @IBOutlet weak var item2 : Item!
    @IBOutlet weak var item3 : Item!
    @IBOutlet weak var item4 : Item!
    @IBOutlet weak var item5 : Item!
    @IBOutlet weak var item6 : Item!
    @IBOutlet weak var item7 : Item!
    @IBOutlet weak var item8 : Item!
    @IBOutlet weak var item9 : Item!
    @IBOutlet weak var item10 : Item!
    
    @IBOutlet weak var cartButton : UIButton!
    @IBOutlet weak var scrollView : UIScrollView!
    
    var products: [Item] = []
    var productsAdded: [ItemModel] = []
    
    let contentView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asegúrate de que el contenido sea más grande que el scroll
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 2500)
        // Ajusta la altura según sea necesario
        scrollView.contentSize = contentView.frame.size
        setCells()
        
        products.append(item1)
        products.append(item2)
        products.append(item3)
        products.append(item4)
        products.append(item5)
        products.append(item6)
        products.append(item7)
        products.append(item8)
        products.append(item9)
        products.append(item10)
        
    }
    
    private func setCells() {
        item1.model  = ItemModel(image: UIImage.item1, name: "Item 1")
        item2.model  = ItemModel(image: UIImage.item2, name: "Item 2")
        item3.model  = ItemModel(image: UIImage.item3, name: "Item 3")
        item4.model  = ItemModel(image: UIImage.item4, name: "Item 4")
        item5.model  = ItemModel(image: UIImage.item5, name: "Item 5")
        item6.model  = ItemModel(image: UIImage.item6, name: "Item 6")
        item7.model  = ItemModel(image: UIImage.item7, name: "Item 7")
        item8.model  = ItemModel(image: UIImage.item8, name: "Item 8")
        item9.model  = ItemModel(image: UIImage.item9, name: "Item 9")
        item10.model = ItemModel(image: UIImage.item10, name: "Item 10")
    }
    
    @IBAction func addProduct(){
        
    }
}
