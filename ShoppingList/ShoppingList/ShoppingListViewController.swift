//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by Diplomado on 22/10/24.
//

import UIKit

//class ShoppingListViewController: UIViewController {
//
//    var productsAdded : [ItemModel] = []
//    let contentView = UIView()
//    
//    @IBOutlet weak var stackView: UIStackView!
//    @IBOutlet weak var scrollView: UIScrollView!
//    
//    
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        
//        let contentView = UIView()
//        stackView?.spacing = 5
//        // Asegúrate de que el contenido sea más grande que el scroll
//        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 2200)
//        // Ajusta la altura según sea necesario
//        scrollView.contentSize = contentView.frame.size
//
//        for product in productsAdded {
//            // Crear la UIImageView y configurar la imagen
//            let imageView = UIImageView(image: product.image)
//            imageView.contentMode = .scaleAspectFit  // Ajustar la imagen
//            imageView.translatesAutoresizingMaskIntoConstraints = false  // Habilitar Auto Layout
//
//            // Establecer restricciones específicas para la UIImageView
//            NSLayoutConstraint.activate([
//                imageView.heightAnchor.constraint(equalToConstant: 150),  // Alto fijo
//                imageView.widthAnchor.constraint(equalToConstant: 150)    // Ancho fijo
//            ])
//            
//            // Agregar la UIImageView al stack view
//            stackView?.addArrangedSubview(imageView)
//
//            // Crear y configurar el UILabel
//            let label = UILabel()
//            label.text = product.name
//            label.textAlignment = .center
//            label.translatesAutoresizingMaskIntoConstraints = false  // Habilitar Auto Layout
//
//            // Establecer restricciones específicas para el UILabel
//            NSLayoutConstraint.activate([
//                label.heightAnchor.constraint(equalToConstant: 30)  // Alto fijo
//            ])
//
//            // Agregar el UILabel al stack view
//            stackView?.addArrangedSubview(label)
//        }
//
//    }
//}
class ShoppingListViewController: UIViewController {

    var productsAdded: [ItemModel] = []
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = UIView()
        stackView.spacing = 5

        // Eliminar el contentView innecesario
        // Asegúrate de que el stackView tenga sus restricciones configuradas para ajustarse al scrollView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Establecer restricciones para el stackView dentro del scrollView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Esto es importante para que funcione el scroll
        ])
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        contentView.frame = CGRect(x: 0, y: 0, width: Int(scrollView.frame.width), height: 200*productsAdded.count)
        // Ajusta la altura según sea necesario
        scrollView.contentSize = contentView.frame.size
        
        // Agregar productos al stackView
        for product in productsAdded {
            // Crear la UIImageView y configurar la imagen
            let imageView = UIImageView(image: product.image)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            // Establecer restricciones específicas para la UIImageView
            imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            
            // Agregar la UIImageView al stack view
            stackView.addArrangedSubview(imageView)

            // Crear y configurar el UILabel
            let label = UILabel()
            label.text = product.name
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            // Establecer restricciones específicas para el UILabel
            label.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            // Agregar el UILabel al stack view
            stackView.addArrangedSubview(label)
        }
    }
}
