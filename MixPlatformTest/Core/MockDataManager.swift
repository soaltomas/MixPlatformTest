import Foundation
import UIKit

class MockDataManager: DataManager {
    func getVideo() -> [Video] {
        let spiderManVideo = Video(cover: UIImage(named: "spider-man"),
                          name: "Человек-Паук 2",
                          year: "2014")
        let ironManVideo = Video(cover: UIImage(named: "iron-man"),
                                 name: "Железный человек",
                                 year: "2008")
        let underworldVideo = Video(cover: UIImage(named: "underworld"),
                                    name: "Другой мир",
                                    year: "2006")
        let bourneVideo = Video(cover: UIImage(named: "bourne"),
                                name: "Идентификация Борна",
                                year: "2002")
        let matrixVideo = Video(cover: UIImage(named: "matrix"),
                                name: "Матрица",
                                year: "1999")
        let video = [spiderManVideo,
                     ironManVideo,
                     underworldVideo,
                     bourneVideo,
                     matrixVideo]
        return video
    }
    
    
}
