//
//  ModelCellAlbums.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

struct ModelCellAlbums {
    let type: ModelCellType
    let titleImage: UIImageView
    let titleLabel: String
    let titleCount: String
}

struct Sections {
    let title: String
    let cells: [ModelCellAlbums]
}
