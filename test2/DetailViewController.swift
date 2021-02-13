//
//  DetailViewController.swift
//  test2
//
//  Created by 조영우 on 2021/02/13.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgLabel.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(info: BountyInfo) {
        self.bountyInfo = info
    }
}
