//
//  EpisodeViewModel.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import UtilitiesKit

class EpisodeViewModel {
    var id: String?
    var name: String?
    var description: String?
    var podcastName: String?
    var imageLink: String?
    var audioLink: String?
    var duration: String?
    var releaseDate: String?
    var dateTime: String?
    
    // MARK: - Initialization
    init(entity: EpisodesEntity?) {
        id = entity?.id
        name = entity?.name
        description = entity?.description
        podcastName = entity?.podcastName
        imageLink = entity?.image
        audioLink = entity?.audioLink
        releaseDate = getReleaseDateString(dateString: entity?.releaseDate)
        duration = getMinutesDuration(seconds: entity?.duration ?? 0)
        dateTime = "\(releaseDate ?? "") . \(duration ?? "")"
    }

    // MARK: - Private Methods
    func getMinutesDuration(seconds: Int) -> String {
        let duration = seconds.getTimeDuration()
        return "\(duration.minutes) \("minute_key".localized)"
    }

    private func getReleaseDateString(dateString: String?) -> String? {
        guard let dateString = dateString else { return nil }
        let date = Date(httpDateString: dateString)
        return date?.toString(format: "MMMM yyyy", locale: Language.isArabic ? "ar" : "en")
    }
}
