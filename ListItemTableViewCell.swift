//  ListItemTableViewCell.swift
//  ListItems

import UIKit
class ListItemTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var idLabel = UILabel()
    var images = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        let boxView = UIView.init(frame: CGRect(x : 5 , y : 5 , width :UIScreen.main.bounds.size.width - 12*2, height : self.frame.size.height))
        
        self.contentView.backgroundColor = UIColor.clear
        boxView.backgroundColor = UIColor.white
        boxView.layer.cornerRadius = 2.0
        self.contentView.addSubview(boxView)
      
        
        images = UIImageView(frame: CGRect(x: 5, y: 5, width: 100, height: 80))
        boxView.addSubview(images)
        images.clipsToBounds = true
        images.contentMode = .scaleAspectFill
        images.backgroundColor = .red
        images.layer.cornerRadius = 30.0
        
        nameLabel = UILabel(frame:CGRect(x:115 , y:40 , width: boxView.frame.size.width - 110 , height: 40) )
        nameLabel.textColor = UIColor.black
        nameLabel.font = .systemFont(ofSize: 18 , weight: .bold)
        boxView.addSubview(nameLabel)
       
        
        idLabel = UILabel(frame:CGRect(x:115 , y:00 , width: boxView.frame.size.width - 110 , height: 40) )
        boxView.addSubview(idLabel)
        idLabel.textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

