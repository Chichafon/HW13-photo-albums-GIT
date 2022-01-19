//
//  TypesOfMediaFilesViewCell.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class TypesOfMediaFilesCell: UICollectionViewCell {

    //MARK: - Initials

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupHierarchy()
        setupLayout()
    }
    //MARK: - Properties

    lazy var iconContainer: UIView = {
        let view = UIView()

        return view
    }()

    var arrowContainer: UIView = {
        let view = UIView()

        return view
    }()

    lazy var titleLabel: UILabel = {
        let titleLable = UILabel()
        titleLable.textColor = .systemBlue
        titleLable.font = MetricsPeopleAndPlacesCell.labelFont

        return titleLable
    }()

    lazy var labelPhotoCount: UILabel = {
        let labelPhotoCount = UILabel()
        labelPhotoCount.textColor = .gray
        labelPhotoCount.font = MetricsPeopleAndPlacesCell.labelFont

        return labelPhotoCount
    }()

    lazy var cellImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.tintColor = .systemBlue
        cellImage.backgroundColor = .white
        cellImage.contentMode = .scaleAspectFill

        return cellImage
    }()

    let arrowImageView: UIImageView = {
        var image = UIImageView()
        image.tintColor = .systemGray
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit

        return image
    }()

    //MARK: - Setup Hierarchy

    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(cellImage)

        contentView.addSubview(arrowContainer)
        arrowContainer.addSubview(arrowImageView)

        contentView.addSubview(titleLabel)
        contentView.addSubview(labelPhotoCount)
    }

    //MARK: - Setup Laout

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelPhotoCount.translatesAutoresizingMaskIntoConstraints = false
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            iconContainer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            iconContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            iconContainer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            iconContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),

            cellImage.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            cellImage.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            cellImage.widthAnchor.constraint(equalTo: iconContainer.widthAnchor,
                                             constant: MetricsTypesOFMediaFilesCell.cellImageWidthAnchorConstant),
            cellImage.heightAnchor.constraint(equalTo: iconContainer.heightAnchor,
                                              constant: MetricsTypesOFMediaFilesCell.cellImageHeightAnchorConstant),

            arrowContainer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            arrowContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                     constant: MetricsTypesOFMediaFilesCell.arrowContainerTrailingAnchor),
            arrowContainer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            arrowContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),

            arrowImageView.centerYAnchor.constraint(equalTo: arrowContainer.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: arrowContainer.trailingAnchor,
                                                     constant: MetricsTypesOFMediaFilesCell.arrowImageViewTrailingAnchor),
            arrowImageView.widthAnchor.constraint(equalTo: arrowContainer.widthAnchor,
                                                  constant: MetricsTypesOFMediaFilesCell.arrowImageViewWidthAnchor),
            arrowImageView.heightAnchor.constraint(equalTo: arrowContainer.widthAnchor,
                                                   constant: MetricsTypesOFMediaFilesCell.arrowImageViewHeightAnchor),

            titleLabel.topAnchor.constraint(equalTo: iconContainer.topAnchor,
                                            constant: MetricsTypesOFMediaFilesCell.titleLabelTopAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor,
                                                constant: MetricsTypesOFMediaFilesCell.titleLabelLeadingAnchorConstant),

            labelPhotoCount.topAnchor.constraint(equalTo: cellImage.topAnchor),
            labelPhotoCount.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor,
                                                      constant: MetricsTypesOFMediaFilesCell.labelPhotoCountTrailingAnchorConstant)
        ])
    }
}

//MARK: - Metrics

enum MetricsTypesOFMediaFilesCell {
    static let labelFont = UIFont(name: "none", size: 17)

    static let cellImageWidthAnchorConstant: CGFloat = -12
    static let cellImageHeightAnchorConstant: CGFloat = -12

    static let titleLabelTopAnchorConstant: CGFloat = 8
    static let titleLabelLeadingAnchorConstant: CGFloat = 50

    static let arrowContainerTrailingAnchor: CGFloat = -6
    static let arrowImageViewTrailingAnchor: CGFloat = -8
    static let arrowImageViewWidthAnchor: CGFloat = -18
    static let arrowImageViewHeightAnchor: CGFloat = -18

    static let labelPhotoCountTrailingAnchorConstant: CGFloat = -30
}
