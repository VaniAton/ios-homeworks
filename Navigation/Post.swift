import Foundation
import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}
    
    extension Post {
        
        static func make() -> [Post] {
            [
                Post(
                    author: <#T##String#>,
                    description: <#T##String#>,
                    image: <#T##String#>,
                    likes: <#T##Int#>,
                    views: 789
                ),
                Post(
                    author: <#T##String#>,
                    description: <#T##String#>,
                    image: <#T##String#>,
                    likes: <#T##Int#>,
                    views: 953
                ),
                Post(
                    author: <#T##String#>,
                    description: <#T##String#>,
                    image: <#T##String#>,
                    likes: <#T##Int#>,
                    views: 261
                ),
                Post(
                    author: <#T##String#>,
                    description: <#T##String#>,
                    image: <#T##String#>,
                    likes: <#T##Int#>,
                    views:  1237
                ),
            ]
        }
    }

