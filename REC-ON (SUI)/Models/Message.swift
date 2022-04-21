//
//  Message.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/15/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
