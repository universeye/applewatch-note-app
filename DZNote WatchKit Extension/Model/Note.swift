//
//  Note.swift
//  DZNote WatchKit Extension
//
//  Created by Terry Kuo on 2021/7/13.
//

import Foundation

struct Note: Identifiable, Codable  {
    let id: UUID
    let text: String
}
