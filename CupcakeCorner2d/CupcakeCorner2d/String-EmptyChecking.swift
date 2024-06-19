//
//  String-EmptyChecking.swift
//  CupcakeCorner2d
//
//  Created by Janice on 6/19/24.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
