//
//  ProgressView.swift
//  ProgressBar
//
//  Created by Michael Campbell on 1/25/24.
//

import UIKit

class ProgressView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemGreen
        return collection
    }()
    
    var currentIndex: Int = 0
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Setup and layout
    private func configureView() {
        addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProgressCell.self, forCellWithReuseIdentifier: ProgressCell.identifier)
    }
    
    private func configureLayout() {        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: Screen.width * 0.80),
            collectionView.heightAnchor.constraint(equalToConstant: 25.0),       
        ])
    }
    
    //MARK: - CollectionView Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 10
        let spacing: CGFloat = 1
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow) / 1.5
        return CGSize(width: itemDimension, height: itemDimension)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCell.identifier, for: indexPath) as! ProgressCell
                
        return cell
    }
    
    //MARK: - Methods
    func setPipColor() {
        let indexPath = IndexPath.init(row: currentIndex, section: 0)
        print("progressView.indexPath: \(indexPath)")

        if let cell = collectionView.cellForItem(at: indexPath) as? ProgressCell {
            cell.setPipColor(to: UIColor.systemPink)
        }
    }
}
