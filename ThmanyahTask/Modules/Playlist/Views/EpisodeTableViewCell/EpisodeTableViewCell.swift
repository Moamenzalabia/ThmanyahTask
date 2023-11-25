//
//  EpisodeTableViewCell.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import UIKit
import UtilitiesKit

class EpisodeTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeNameLable: UILabel!
    @IBOutlet weak var episodePodcastNameLable: UILabel!
    @IBOutlet weak var episodeDateTimeLable: UILabel!
    @IBOutlet weak var episodePlayButton: UIButton!
    @IBOutlet weak var episodeMenuButton: UIButton!
    @IBOutlet weak var separatorView: UIView!
    
    // MARK: - Properties
    weak var delegate: EpisodeTableViewCellProtocol?
    var dataSource: EpisodeViewModel? {
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
        separatorView.backgroundColor = .lightGlobalLowContrast2
        episodeImageView.addCornerRadius(10)
        episodePlayButton.addTarget(self, action: #selector(episodePlayButtonDidTap), for: .touchUpInside)
        episodeMenuButton.addTarget(self, action: #selector(episodeMenuButtonDidTap), for: .touchUpInside)
    }

    private func setupLabelsFont() {
        episodeNameLable.font = .H3
        episodePodcastNameLable.font = .Body2
        episodeDateTimeLable.font = .Body3
    }

    private func setupLabelsColor() {
        episodeNameLable.textColor = .chimneySweepTwoColor
        episodePodcastNameLable.textColor = .chimneySweepThreeColor
        episodeDateTimeLable.textColor = .chimneySweepThreeColor
    }

    private func prepareData(with dataModel: EpisodeViewModel?) {
        guard let dataModel = dataModel else { return }
        episodeNameLable.text = dataModel.name
        episodePodcastNameLable.text = dataModel.podcastName
        episodeDateTimeLable.text = dataModel.dateTime
        episodeImageView.loadImage(with: dataModel.imageLink)
    }
    
    @objc private func episodePlayButtonDidTap() {
        delegate?.episodePlayButtonDidTap(with: dataSource)
    }
    
    @objc private func episodeMenuButtonDidTap() {
        delegate?.episodeMenuButtonDidTap(with: dataSource)
    }
}

