//
//  PlaylistTableViewHeader.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import UIKit
import UtilitiesKit

class PlaylistTableViewHeader: UITableViewHeaderFooterView {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var playlistImageView: UIImageView!
    @IBOutlet weak var playlistNameLable: UILabel!
    @IBOutlet weak var playlistDescriptionLable: UILabel!
    @IBOutlet weak var playlistMenuButton: UIButton!
    @IBOutlet weak var playlistFavoriteButton: UIButton!
    @IBOutlet weak var playlistBackArrowButton: UIButton!
    @IBOutlet weak var playlistPlayButton: UIButton!
    @IBOutlet weak var playlistDownloadButton: UIButton!
    @IBOutlet weak var playlistBackgroundShadowView: UIView!
    @IBOutlet weak var playlistPlayingTypeView: UIView!
    @IBOutlet weak var playlistPlayingTypeLable: UILabel!
    @IBOutlet weak var playlistPlayingTypeImageView: UIImageView!
    @IBOutlet weak var playlistEpisodesView: UIView!
    @IBOutlet weak var episodesLable: UILabel!
    @IBOutlet weak var playlistEpisodesTimeCount: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    // MARK: - Properties
    weak var delegate: PlaylistTableViewHeaderProtocol?
    var dataSource: PlaylistViewModel? {
        didSet {
            prepareData(with: dataSource)
        }
    }
    
    // MARK: - View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewsAppearance()
        setupBackgroundGradient()
        setupLocalization()
        setupLabelsFont()
        setupLabelsColor()
        setupActions()
    }
    
    // MARK: - Private Methods
    private func setupViewsAppearance() {
        containerView.backgroundColor = .whiteColor
        separatorView.backgroundColor = .lightGlobalLowContrast2
        playlistPlayingTypeView.addCornerRadius()
        playlistEpisodesView.layer.cornerRadius = 8
        playlistEpisodesView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupLocalization() {
        playlistPlayingTypeLable.text = "diversified_playback_key".localized
        episodesLable.text = "episodes_key".localized
        playlistBackArrowButton.setImage(UIImage(named: "playlist_back_arrow_icon")?.flipImageToArabic(), for: .normal)
        playlistPlayingTypeImageView.image = UIImage(named: "playlist_playing_type_icon")?.flipImageToArabic()
    }
    
    private func setupBackgroundGradient() {
        let startColor = UIColor.blackColor.withAlphaComponent(0.3)
        let endColor = UIColor.blackColor.withAlphaComponent(0)
        let gradient = CAGradientLayer(isVertical: true, frame: playlistBackgroundShadowView.frame, colors: [startColor, endColor])
        playlistBackgroundShadowView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupActions() {
        playlistMenuButton.addTarget(self, action: #selector(playlistMenuButtonDidTap), for: .touchUpInside)
        playlistFavoriteButton.addTarget(self, action: #selector(playlistFavoritButtonDidTap), for: .touchUpInside)
        playlistBackArrowButton.addTarget(self, action: #selector(playlistBackArrowButtonDidTap), for: .touchUpInside)
        playlistPlayButton.addTarget(self, action: #selector(playlistPlayButtonDidTap), for: .touchUpInside)
        playlistDownloadButton.addTarget(self, action: #selector(playlistDownloadButtonDidTap), for: .touchUpInside)
        playlistPlayingTypeView.addTapGesture(target: self, action: #selector(playlistPlayingTypeButtonDidTap))
    }
    
    private func setupLabelsFont() {
        playlistNameLable.font = .H1
        playlistPlayingTypeLable.font = .H2
        episodesLable.font = .H2
        playlistDescriptionLable.font = .H3
        playlistEpisodesTimeCount.font = .H4
    }
    
    private func setupLabelsColor() {
        playlistNameLable.textColor = .whiteColor
        playlistDescriptionLable.textColor = .whiteColor
        playlistPlayingTypeLable.textColor = .whiteColor
        episodesLable.textColor = .chimneySweepTwoColor
        playlistEpisodesTimeCount.textColor = .chimneySweepColor
    }
    
    private func prepareData(with dataModel: PlaylistViewModel?) {
        guard let dataModel = dataModel else { return }
        playlistNameLable.text = dataModel.name
        playlistDescriptionLable.text = dataModel.description
        playlistEpisodesTimeCount.text = dataModel.playlistTimeCount
        playlistImageView.loadImage(with: dataModel.imageLink)
        
    }
    
    @objc private func playlistMenuButtonDidTap() {
        delegate?.playlistMenuButtonDidTap(with: dataSource)
    }
    
    @objc private func playlistFavoritButtonDidTap() {
        delegate?.playlistFavoritButtonDidTap(with: dataSource)
    }
    
    @objc private func playlistBackArrowButtonDidTap() {
        delegate?.playlistBackArrowButtonDidTap()
    }
    
    @objc private func playlistPlayButtonDidTap() {
        delegate?.playlistPlayButtonDidTap(with: dataSource)
    }
    
    @objc private func playlistDownloadButtonDidTap() {
        delegate?.playlistDownloadButtonDidTap(with: dataSource)
    }
    
    @objc private func playlistPlayingTypeButtonDidTap() {
        delegate?.playlistPlayingTypeButtonDidTap(with: dataSource)
    }
    
}
