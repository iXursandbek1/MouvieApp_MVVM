//
//  MainMovieCell.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 07/08/23.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifire: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    //IBOutlets:
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(collor: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableViewCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
