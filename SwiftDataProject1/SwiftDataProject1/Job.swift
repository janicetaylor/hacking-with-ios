//
//  Job.swift
//  SwiftDataProject1
//
//  Created by Janice on 6/22/24.
//

import Foundation
import SwiftData


@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
