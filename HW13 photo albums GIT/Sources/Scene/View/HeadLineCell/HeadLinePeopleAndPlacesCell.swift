//
//  HeadLinePeopleAndPlacesCell.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class HeadLinePeopleAndPlacesCell: UICollectionReusableView {

    // MARK: - Properties

    private var label: UILabel = {

        let label = UILabel()
        label.text = "Люди и места"
        label.textColor = .black
        label.font = MetricsPeopleAndPlaces.labelFont
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
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                       constant: MetricsPeopleAndPlaces.labelTopAnchorConstant),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                           constant: MetricsPeopleAndPlaces.labelLeadingAnchorContstant)
        ])
    }
}

// MARK: - Metrics

enum MetricsPeopleAndPlaces {

    static let labelFont: UIFont = .boldSystemFont(ofSize: 20)

    static let labelTopAnchorConstant: CGFloat = 10
    static let labelLeadingAnchorContstant: CGFloat = 5
}
