//
//  HomePlaylistViewModel.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import UtilitiesKit

class HomePlaylistViewModel {
    var id: String?
    var name: String?
    var description: String?
    var access: String?
    var imageLink: String?
    var duration: String?
    var releaseDate: String?
    var dateTime: String?
    
    // MARK: - Initialization
    init(entity: HomePlayListEntity?) {
        id = entity?.id
        name = entity?.name
        description = entity?.description
        access = entity?.access
        imageLink = entity?.image
        releaseDate = getCreatedDateString(dateString: entity?.createdAt)
        duration = getHoursDuration(seconds: entity?.episodeTotalDuration ?? 0)
        dateTime = "\(releaseDate ?? "") . \(duration ?? "")"
    }

    // MARK: - Private Methods
    func getHoursDuration(seconds: Int) -> String {
        let duration = seconds.getTimeDuration()
        return "\(duration.hours) \("hours_key".localized)"
    }

    private func getCreatedDateString(dateString: String?) -> String? {
        guard let dateString = dateString else { return nil }
        let date = Date(httpDateString: dateString)
        return date?.toString(format: "MMMM yyyy", locale: Language.isArabic ? "ar" : "en")
    }
}
