//
//  HeadLineAlbumsCell.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class HeadLineAlbumsCell: UICollectionReusableView {

    // MARK: - Properties

    private var label: UILabel = {
        let label = UILabel()
        label.text = "Мои альбомы"
        label.textColor  = .black
        label.font = MetricHeaderCellMyAlbums.labelFont
        label.textAlignment = .left

        return label
    }()

    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("См. все", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return button
    } ()

    // MARK: - Actions

    @objc private func buttonAction() {
        print("Press button: См. все")
    }

    // MARK: - Setup Layout

    public func configure() {
        addSubview(label)
        addSubview(button)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        falseTranslatesAutoresizingMaskIntoConstraints()

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: MetricHeaderCellMyAlbums.labeleTopAnchorConstant),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: MetricHeaderCellMyAlbums.labelLeadingAnchorConstant),

            button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: MetricHeaderCellMyAlbums.buttonTrailingAnchorConstant)
        ])
    }

    private func falseTranslatesAutoresizingMaskIntoConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric

struct MetricHeaderCellMyAlbums {

    static let labelFont: UIFont = .boldSystemFont(ofSize: 20)

    static let labeleTopAnchorConstant: CGFloat = 10
    static let labelLeadingAnchorConstant: CGFloat = 5

    static let buttonTrailingAnchorConstant: CGFloat = -10
}
