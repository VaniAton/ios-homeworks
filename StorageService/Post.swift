import Foundation

public struct Post {
    public let author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}

public extension Post {
    
    static func make() -> [Post] {
        [
        Post(
            author: "FGTeeV",
            description: "My first post in this website!",
            image: "post1User1",
            likes: 73,
            views: 789
        ),
        Post(
            author: "JuegaGerman",
            description: "My first post in this website!",
            image: "post2User2",
            likes: 54,
            views: 953
        ),
        Post(
            author: "elrubiusOMG",
            description: "My first post in this website!",
            image: "post3User3",
            likes: 112,
            views: 261
        ),
        Post(
            author: "Pewdiepie",
            description: "My first post in this website!",
            image: "post4User4",
            likes: 305,
            views:  1237
        ),
        ]
    }
}
