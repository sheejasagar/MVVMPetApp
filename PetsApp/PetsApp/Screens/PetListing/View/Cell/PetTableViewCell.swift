//
//  PetCell.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import UIKit
import SDWebImage

class PetTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    
    // MARK: - Costants
    private let placeholder = "placeholder"
    
    // MARK: - Get Cell Identifier and Xib Name
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    // MARK: - Declarations
    var pet: PetData? {
        didSet {
            lblTitle.text = pet?.title
            lblDate.text = pet?.dateAdded
            if let imageURL = pet?.imageURL {
                imgProfile.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: placeholder))
            }
        }
    }
    
    // MARK: - Override Method
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    // MARK: - Custom Methods
    func initView() {
        backgroundColor = .white
        selectionStyle = .none;
        
        imgProfile.clipsToBounds = true
        imgProfile.layer.cornerRadius = imgProfile.frame.width/2
        imgProfile.layer.borderColor = UIColor.clear.cgColor
        
        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
}
