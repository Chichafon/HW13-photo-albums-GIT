//
//  HeadLineTypesOfMediaCell.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class HeadLineTypesOfMediaCell: UICollectionReusableView {

    // MARK: - Properties

    private var label: UILabel = {

        let label = UILabel()
        label.text = "Типы медиафайлов"
        label.textColor = .black
        label.font = MetricsTypesOfMedia.labelFont
        label.textAlignment = .left

        return label
    }()

    //MARK: - Setup Layout

    public func configure() {
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                       constant: MetricsTypesOfMedia.labelTopAnchorConstant),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                           constant: MetricsTypesOfMedia.labelLeadingAnchorContstant)
        ])
    }
}

// MARK: - Metrics

enum MetricsTypesOfMedia {

    static let labelFont: UIFont = .boldSystemFont(ofSize: 20)

    static let labelTopAnchorConstant: CGFloat = 10
    static let labelLeadingAnchorContstant: CGFloat = 5
}
