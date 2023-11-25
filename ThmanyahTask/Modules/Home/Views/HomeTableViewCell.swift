//
//  HomeTableViewCell.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import UIKit
import UtilitiesKit

class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var playlistImageView: UIImageView!
    @IBOutlet weak var playlistNameLable: UILabel!
    @IBOutlet weak var playlistDescriptionLable: UILabel!
    @IBOutlet weak var playlistEpisodesTimeCount: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    // MARK: - Properties
    var dataSource: HomePlaylistViewModel? {
        didSet {
            prepareData(with: dataSource)
        }
    }

    // MARK: - View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewsAppearance()
        setupLabelsFont()
        setupLabelsColor()
    }
    
    // MARK: - Private Methods
    private func setupViewsAppearance() {
        containerView.backgroundColor = .whiteColor
        containerView.layer.layerShadow(
            color: .blackColor,
            alpha: 0.12,
            x: 0,
            y: 2,
            blur: 4,
            spread: 0)
        separatorView.backgroundColor = .lightGlobalLowContrast2
        playlistImageView.addCornerRadius(10)
    }

    private func setupLabelsFont() {
        playlistNameLable.font = .H3
        playlistDescriptionLable.font = .Body2
        playlistEpisodesTimeCount.font = .Body3
    }

    private func setupLabelsColor() {
        playlistNameLable.textColor = .chimneySweepTwoColor
        playlistDescriptionLable.textColor = .chimneySweepThreeColor
        playlistEpisodesTimeCount.textColor = .chimneySweepThreeColor
    }
    
    private func prepareData(with dataModel: HomePlaylistViewModel?) {
        guard let dataModel = dataModel else { return }
        playlistNameLable.text = dataModel.name
        playlistDescriptionLable.text = dataModel.description
        playlistEpisodesTimeCount.text = dataModel.dateTime
        playlistImageView.loadImage(with: dataModel.imageLink)
    }
}
