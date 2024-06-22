//
//  UsersView.swift
//  SwiftDataProject1
//
//  Created by Janice on 6/22/24.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.jobs.count))
                        
                }
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: \User.name)
    }
    
    func addSample() {
        let user = User(name: "Piper Chapman", city: "Houston", joinDate: .now)
        let job1 = Job(name: "Organize books", priority: 3)
        let job2 = Job(name: "Do laundry", priority: 2)
        
        modelContext.insert(user)
        
        user.jobs.append(job1)
        user.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
