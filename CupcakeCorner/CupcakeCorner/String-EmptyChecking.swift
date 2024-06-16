//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Janice on 6/16/24.
//

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty 
    }
}
