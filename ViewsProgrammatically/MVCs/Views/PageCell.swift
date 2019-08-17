//
//  PageCell.swift
//  ViewsProgrammatically
//
//  Created by Jesus Santiago Carrasco Campa on 8/16/19.
//  Copyright © 2019 Techson. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            guard let unwrappedPage = page else {return}
            boatImgView.image = UIImage(named: unwrappedPage.imageName)
            
            let textAttribute = NSMutableAttributedString(string: unwrappedPage.headerText, attributes:
                [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            textAttribute.append(NSAttributedString(string: unwrappedPage.descriptionText, attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
                 NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptioTV.attributedText = textAttribute
            descriptioTV.textAlignment = .center
        }
    }
    
    private let boatImgView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imageView.contentMode = .scaleAspectFit
        
        //Activate auto layouts
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptioTV: UITextView = {
        let textView = UITextView()
        let textAttribute = NSMutableAttributedString(string: "Float helps you to choose better your boat!", attributes:
            [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        textAttribute.append(NSAttributedString(string: "\n\n\nFloat brings you the better options to have a great time in the sea with friends!", attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        textView.attributedText = textAttribute
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout(){
        let topImgContainerView = UIView()
        addSubview(topImgContainerView)
        topImgContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //Que sea la mitad de alto de la vista principal
        topImgContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImgContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImgContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImgContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImgContainerView.addSubview(boatImgView)
        
        boatImgView.centerXAnchor.constraint(equalTo: topImgContainerView.centerXAnchor).isActive = true
        boatImgView.centerYAnchor.constraint(equalTo: topImgContainerView.centerYAnchor).isActive = true
        boatImgView.heightAnchor.constraint(equalTo: topImgContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptioTV)
        descriptioTV.topAnchor.constraint(equalTo: topImgContainerView.bottomAnchor).isActive = true
        descriptioTV.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptioTV.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptioTV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
