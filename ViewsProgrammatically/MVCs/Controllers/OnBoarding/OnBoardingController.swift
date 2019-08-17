//
//  OnBoardingController.swift
//  ViewsProgrammatically
//
//  Created by Jesus Santiago Carrasco Campa on 8/16/19.
//  Copyright © 2019 Techson. All rights reserved.
//

import UIKit

class OnBoardingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [Page(imageName: "Logo", headerText: "Simple Header Text to show up!!", descriptionText: "\n\n\nThis was maded full-programmatically without storyboards!"),
                Page(imageName: "ImgDefault", headerText: "It'll be better in the next examples", descriptionText: "\n\n\nSo stay tune with this accoutn github.com/santychuy 📱")]
    
    private let previousBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("PREV", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return btn
    }()
    
    private let nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("NEXT", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btn
    }()
    
    //Lazy = se puede acceder miembros de esta clase
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.isPagingEnabled = true
        
    }
    
    fileprivate func setupBottomControls(){
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousBtn, pageControl, nextBtn])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //O puede ser (utilizaré esta forma en adelante)
        /*NSLayoutConstraint.activate([
         previousBtn.topAnchor.constraint(equalTo: view.topAnchor),
         previousBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         previousBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         previousBtn.heightAnchor.constraint(equalToConstant: 50)
         ])*/
    }
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let index = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrev(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let index = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    
}
