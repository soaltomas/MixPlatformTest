import Foundation
import UIKit

/// Collection view cell for display video entity
class VideoCollectionViewCell: UICollectionViewCell {
    
    var cover: UIImageView!
    
    var name: UILabel!
    
    var year: UILabel!
    
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cover = UIImageView()
        name = UILabel()

        year = UILabel()
        self.backgroundColor = .black
        name.textColor = .white
        year.textColor = .gray
        
        stackView.addArrangedSubview(cover)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(year)
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        addSubview(stackView)
        
        cover.layer.cornerRadius = 5
        cover.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
