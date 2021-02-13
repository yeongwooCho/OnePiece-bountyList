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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    func prepareAnimation() {
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: view.bounds.width).scaledBy(x: 4, y: 4).rotated(by: 180)
        nameLabel.alpha = 0
        
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: -view.bounds.width).scaledBy(x: 4, y: 4).rotated(by: 180)
        bountyLabel.alpha = 0
        
    }
    
    func showAnimation() {
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
//
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: self.view.layoutIfNeeded, completion: nil)
        UIView.animate(withDuration: 10, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        }, completion: nil)

        UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.transition(with: imgLabel, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)

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
