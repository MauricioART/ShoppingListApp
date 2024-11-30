//
//  ProductsViewController.swift
//  ShoppingList
//
//  Created by Diplomado on 12/10/24.
//

import UIKit

class ProductsViewController: UIViewController {
   

    @IBOutlet weak var cartButton : UIButton!
    @IBOutlet weak var tableView : UITableView!
    
    
    var dataSource: UITableViewDiffableDataSource<Int,ProductModel>?
    
    var productsAdded: [ProductModel] = []
    var products: [ProductModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProducts()
        setDataSource()
        setSnapshot()
        
    }
    
    func setDataSource(){
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProductTableViewCell ?? ProductTableViewCell()
            cell.productImage.image = itemIdentifier.image
            cell.productName.text = itemIdentifier.name
            return cell
        })
    }

    func setSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int,ProductModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(products)
        dataSource?.apply(snapshot)
    }
    
    @IBAction func openShoppingList(){
        ShoppingListSegueXIB()
    }
    
    private func ShoppingListSegueXIB() {
        let shoppingListController = ShoppingListViewController(nibName: nil, bundle: nil)
        shoppingListController.productsAdded = productsAdded
        present(shoppingListController, animated: true)
    }
    
    private func setProducts() {
        products.append(ProductModel(image: UIImage.item1, name: "Item 1"))
        products.append(ProductModel(image: UIImage.item2, name: "Item 2"))
        products.append(ProductModel(image: UIImage.item3, name: "Item 3"))
        products.append(ProductModel(image: UIImage.item4, name: "Item 4"))
        products.append(ProductModel(image: UIImage.item5, name: "Item 5"))
        products.append(ProductModel(image: UIImage.item6, name: "Item 6"))
        products.append(ProductModel(image: UIImage.item7, name: "Item 7"))
        products.append(ProductModel(image: UIImage.item8, name: "Item 8"))
        products.append(ProductModel(image: UIImage.item9, name: "Item 9"))
        products.append(ProductModel(image: UIImage.item10, name: "Item 10"))
        
    }
}

extension ProductsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(myArray[indexPath.row])
    }
}
