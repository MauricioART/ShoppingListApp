//
//  Item.swift
//  ShoppingList
//
//  Created by Diplomado on 12/10/24.
//

import UIKit

class Item: UIView {
    
    weak var delegate: ItemDelegate?
    
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var itemName: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    
    
    var buttonState : ButtonState = .unselected
    
    var model: ItemModel! {
        didSet {
            imageView.image = model.image
            itemName.text = model.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewBundleInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViewBundleInit()
    }
    
    private func setViewBundleInit() {
        guard let contentView = Bundle.main.loadNibNamed("Item", owner: self)?.first as? UIView else { return }
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    @IBAction func addProduct(){
        switch( buttonState){
        case .selected:
            addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
            addButton.tintColor = .systemBlue
            buttonState = .unselected
        case .unselected:
            addButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            addButton.tintColor = .systemMint
            buttonState = .selected
        }
        delegate?.didTapButton(with: self.model, state: buttonState)
//        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
//    @objc private func buttonTapped() {
//        delegate?.didTapButton(with: self.model)
//    }
    
}
enum ButtonState {
    case selected
    case unselected
}

protocol ItemDelegate: AnyObject {
    func didTapButton(with info: ItemModel, state : ButtonState)
}
