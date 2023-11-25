//
//  HomePlayListEntity.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

struct HomePlayListEntity: Codable {
    let id: String?
    let type: Int?
    let name: String?
    let description: String?
    let image: String?
    let access: String?
    let status: String?
    let episodeCount: Int?
    let episodeTotalDuration: Int?
    let episodes: [String: Int]?
    let createdAt: String?
    let updatedAt: String?
    let isDeleted: Bool?
    let followingCount: Int?
    let userId: String?
}

struct PaginationEntity: Codable {
    let next : String?
}
