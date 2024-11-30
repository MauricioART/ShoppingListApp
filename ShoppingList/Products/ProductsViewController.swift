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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        snapshot.appendItems([])
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
    
}

extension ProductsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(myArray[indexPath.row])
    }
}
