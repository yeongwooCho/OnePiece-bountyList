//
//  ViewController.swift
//  test2
//
//  Created by 조영우 on 2021/02/13.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    let viewModel = BountyViewModel()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.bountyListCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        cell.update(info: viewModel.getInfo(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textArea: CGFloat = 65
        
        let width: CGFloat = ((collectionView.bounds.width) - itemSpacing)/2
        let height: CGFloat = width*(10/7) + textArea
        return CGSize(width: width, height: height)
    }
}


class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        let img = UIImage(named: "\(info.name).jpg")
        imgLabel.image = img
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}


struct BountyInfo {
    let name: String
    let bounty: Int
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}


class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "nami", bounty: 30000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "robin", bounty: 70000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList: [BountyInfo] {
        let sortedInfoList = bountyInfoList.sorted { (prev, next) -> Bool in
            return prev.bounty > next.bounty
        }
        return sortedInfoList
    }
    
    var bountyListCount: Int{
        return self.bountyInfoList.count
    }
    
    func getInfo(index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
