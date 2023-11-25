//
//  EpisodesEntity.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

struct EpisodesEntity: Codable {
    let id: String?
    let itunesId: String?
    let type: Int?
    let name: String?
    let description: String?
    let image: String?
    let imageBigger: String?
    let audioLink: String?
    let duration: Int?
    let durationInSeconds: Int?
    let views: Int?
    let podcastItunesId: String?
    let podcastName: String?
    let releaseDate: String?
    let createdAt: String?
    let updatedAt: String?
    let isDeleted: Bool?
    let chapters: [ChapterEntity]?
    let isEditorPick: Bool?
    let sentNotification: Bool?
    let position: Int?
}

struct ChapterEntity: Codable {
    let start: Int?
    let title: String?
}
