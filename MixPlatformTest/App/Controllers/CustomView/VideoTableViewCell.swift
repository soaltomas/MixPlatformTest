import Foundation
import UIKit

/// Table view cell containing a list of video
class VideoTableViewCell: UITableViewCell {
    
    let cellId = "Cell"
    
    var categoryName: UILabel!
    
    var moreButton: UIButton!
    
    var videoCollection: UICollectionView!
    
    let dataManager = MockDataManager()
    
    var dataSourceList: [Video] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
        
        dataSourceList = dataManager.getVideo()
        
        categoryName = UILabel()
        categoryName.text = Constants.category
        categoryName.textColor = .orange
        
        moreButton = UIButton()
        moreButton.setTitle(Constants.more, for: .normal)
        moreButton.setTitleColor(.orange, for: .normal)
        moreButton.titleLabel?.font = .systemFont(ofSize: 14)
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/2)
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        videoCollection = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: collectionLayout)
        self.backgroundColor = .black
        
        addSubview(categoryName)
        addSubview(moreButton)
        addSubview(videoCollection)
        videoCollection.delegate = self
        videoCollection.dataSource = self
        
        videoCollection.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        Constraints for interior view
        let views: [String : Any] = ["categoryName" : categoryName,
                                     "moreButton" : moreButton,
                                     "videoCollection" : videoCollection]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let categoryNameVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[categoryName]-[videoCollection]",
                                                                     options: [],
                                                                     metrics: nil,
                                                                     views: views)
        allConstraints += categoryNameVerticalConstraint
        let categoryNameHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[categoryName]",
                                                                       options: [],
                                                                       metrics: nil,
                                                                       views: views)
        allConstraints += categoryNameHorizontalConstraint
        let moreButtonVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[moreButton]-[videoCollection]|",
                                                                            options: [],
                                                                            metrics: nil,
                                                                            views: views)
        allConstraints += moreButtonVerticalConstraint
        let moreButtonHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:[moreButton]|",
                                                                              options: [],
                                                                              metrics: nil,
                                                                              views: views)
        allConstraints += moreButtonHorizontalConstraint
        let videoCollectionVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:[videoCollection]|",
                                                                          options: [],
                                                                          metrics: nil,
                                                                          views: views)
        allConstraints += videoCollectionVerticalConstraint
        let videoCollectionHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[videoCollection]|",
                                                                            options: [],
                                                                            metrics: nil,
                                                                            views: views)
        allConstraints += videoCollectionHorizontalConstraint
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        videoCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(allConstraints)
    }
}

// MARK: - Extension providing work with collection view
extension VideoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCollectionViewCell
        cell.cover.image = dataSourceList[indexPath.row].cover
        cell.name.text = dataSourceList[indexPath.row].name
        cell.year.text = dataSourceList[indexPath.row].year
        cell.frame = CGRect(x: cell.frame.origin.x, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/2)
        cell.stackView.frame = CGRect(x: 0, y: 0, width: self.frame.width/3, height: self.frame.height-80)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
