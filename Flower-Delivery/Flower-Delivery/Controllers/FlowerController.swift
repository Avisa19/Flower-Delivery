//
//  FlowerController.swift
//  Flower-Delivery
//
//  Created by Avisa Poshtkouhi on 7/20/20.
//  Copyright © 2020 Avisa Poshtkouhi. All rights reserved.
//

import SwiftUI

class FlowerController: UICollectionViewController {
    
    fileprivate let CELL_ID = "CellID"
    fileprivate static let CA_HEADER_ID = "CategoryHeaderID"
    fileprivate let HEADER_ID = "HeaderID"
    
    init() {
        super.init(collectionViewLayout: FlowerController.createLayout())
    }
    
    fileprivate static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                return section
            } else {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: CA_HEADER_ID, alignment: .topLeading)
                ]
                return section
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HEADER_ID, for: indexPath)
        return header
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath)
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .systemBlue
        case 1:
            cell.backgroundColor = .systemPink
        default:
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.init(white: 0.5, alpha: 0.1)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CELL_ID)
        collectionView.register(Header.self, forSupplementaryViewOfKind: FlowerController.CA_HEADER_ID, withReuseIdentifier: HEADER_ID)
    }
}


struct FlowerController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
}
