//
//  Models.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/27/21.
//

import Foundation

struct Module : Decodable, Identifiable{
    
    var id: Int
    var category: String
    var content: [Content]
}

struct Content : Decodable, Identifiable{
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var Lessons: [Lesson]
}

struct Lesson : Decodable, Identifiable{
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}
