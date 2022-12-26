//
//  ViewController.swift
//  Shahnewaz_30020_15Dec
//
//  Created by BJIT on 12/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let galleyCellNib = UINib(nibName: Constants.galleryCVCellId, bundle: nil)
        collectionView.register(galleyCellNib, forCellWithReuseIdentifier: Constants.galleryCVCellId)
        
        let userInfoHeader = UINib(nibName: Constants.userInfoCVHeader, bundle: nil)
        collectionView.register(userInfoHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.userInfoCVHeader)
        

        let insets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        
        largeItem.contentInsets = insets
        
        let leftSmallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        

        let leftSmallItem = NSCollectionLayoutItem(layoutSize: leftSmallItemSize)
        
        leftSmallItem.contentInsets = insets
       
        let vertGroup1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        
        let verticalGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: vertGroup1Size, subitems: [leftSmallItem])
        
       
        
        
        let rightSmallItem1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        
        let rightSmallItem1 = NSCollectionLayoutItem(layoutSize: rightSmallItem1Size)
        
        rightSmallItem1.contentInsets = insets
        
        
        let rightSmallItem2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/3))
        

        let rightSmallItem2 = NSCollectionLayoutItem(layoutSize: rightSmallItem2Size)
        
        rightSmallItem2.contentInsets = insets
       
        let vertGroup2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        
        let verticalGroup2 = NSCollectionLayoutGroup.vertical(layoutSize: vertGroup2Size, subitems: [rightSmallItem1, rightSmallItem2])
        
        
        
        let horiGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/3))
        
        let horiGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horiGroupSize, subitems: [verticalGroup1, verticalGroup2])
        
        
        
        
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(2))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [horiGroup, largeItem])

        collectionView.collectionViewLayout = customLayout(outerGroup: outerGroup)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.segueToImagePreviewId
        {
            
            if let destination = segue.destination as? ImagePreviewVC
            {
                destination.imageName = UserData.data[selectedIndex].name
                destination.index = selectedIndex
            }
        }
    }


}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserData.data.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.galleryCVCellId, for: indexPath) as! GalleryCVCell
        
        galleryCell.galleryImage.layer.cornerRadius = 20
        
        galleryCell.galleryImage.image = UIImage(named: UserData.data[indexPath.row].name)
        return galleryCell
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.userInfoCVHeader, for: indexPath) as! UserInfoCVHeader

          return cell
      }
    
  
    
    func customLayout(outerGroup: NSCollectionLayoutGroup) -> UICollectionViewLayout {

           let headerSize = NSCollectionLayoutSize(
               widthDimension: .fractionalWidth(1.0),
               heightDimension: .fractionalHeight(0.42)
           )
           let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: headerSize,
               elementKind: UICollectionView.elementKindSectionHeader,
               alignment: .top
           )

           let section = NSCollectionLayoutSection(group: outerGroup)
           section.boundarySupplementaryItems = [sectionHeader]
           let compositionaLayout = UICollectionViewCompositionalLayout(section: section)
           return compositionaLayout
       
   }
    
   
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: Constants.segueToImagePreviewId, sender: nil)
    }

}



