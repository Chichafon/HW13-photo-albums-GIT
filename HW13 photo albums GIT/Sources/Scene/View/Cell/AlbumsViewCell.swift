//
//  AlbumsViewCell.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class AlbumsViewCell: UICollectionViewCell {

    // MARK: - Initial

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
    }

    //MARK: - Properties

    lazy var titleLabel: UILabel = {
        let titleLable = UILabel()
        titleLable.textColor = .black
        titleLable.font = MetricsAlbumsCell.labelFont

        return titleLable
    }()

    lazy var labelPhotoCount: UILabel = {
        let labelPhotoCount = UILabel()
        labelPhotoCount.textColor = .gray
        labelPhotoCount.font = MetricsAlbumsCell.labelFont

        return labelPhotoCount
    }()

    lazy var cellImage: UIImageView = {
        let cellImage = UIImageView()

        return cellImage
    }()

    //MARK: - Setup Layout

    private func setupLayout() {

        contentView.addSubview(titleLabel)
        contentView.addSubview(labelPhotoCount)
        contentView.addSubview(cellImage)

        cellImage.clipsToBounds = true
        cellImage.layer.masksToBounds = true
        cellImage.layer.cornerRadius = MetricsAlbumsCell.cellImageCornerRadius
        cellImage.contentMode = UIView.ContentMode.scaleAspectFill

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelPhotoCount.translatesAutoresizingMaskIntoConstraints = false
        cellImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: MetricsAlbumsCell.cellImageTopAnchor),
            cellImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: MetricsAlbumsCell.cellImageLeadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: MetricsAlbumsCell.cellItemTrailingAnchorConstant),
            cellImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: MetricsAlbumsCell.titleLabelTopAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: MetricsAlbumsCell.titleLabelLeadingAnchorConstant),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: MetricsAlbumsCell.titleLabelTrailingAnchorConstant),

            labelPhotoCount.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: MetricsAlbumsCell.labelPhotoCountTopAnchorConstant),
            labelPhotoCount.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: MetricsAlbumsCell.labelPhotoCountLeadingAnchorConstant),
            labelPhotoCount.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: MetricsAlbumsCell.labelPhotoCountTrailingAnchorConstant)
        ])
    }
}

//MARK: - Metrics

enum MetricsAlbumsCell {
    static let labelFont = UIFont(name: "None", size: 17)

    static let cellImageCornerRadius: CGFloat = 5

    static let cellImageTopAnchor: CGFloat = 5
    static let cellImageLeadingAnchor: CGFloat = 5
    static let cellItemTrailingAnchorConstant: CGFloat = -5

    static let titleLabelTopAnchorConstant: CGFloat = 5
    static let titleLabelLeadingAnchorConstant: CGFloat = 5
    static let titleLabelTrailingAnchorConstant: CGFloat = 5

    static let labelPhotoCountTopAnchorConstant: CGFloat = 5
    static let labelPhotoCountLeadingAnchorConstant: CGFloat = 5
    static let labelPhotoCountTrailingAnchorConstant: CGFloat = 5
}

