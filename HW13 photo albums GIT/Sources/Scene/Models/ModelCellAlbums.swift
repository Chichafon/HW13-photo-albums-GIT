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

extension Sections {

    static var data = [
        Sections(
            title: "Заголовок",
            cells: [
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo1")),
                            titleLabel: "Недавние",
                            titleCount: "9259"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo9")),
                            titleLabel: "Избранные",
                            titleCount: "123"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo7")),
                            titleLabel: "Instagramm",
                            titleCount: "654"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo5")),
                            titleLabel: "WhatsApp",
                            titleCount: "111"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo2")),
                            titleLabel: "FaceApp",
                            titleCount: "222"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo4")),
                            titleLabel: "Gradient",
                            titleCount: "333"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo10")),
                            titleLabel: "Movavi Clips",
                            titleCount: "444"),
            ModelCellAlbums(type: .cellMyAlbums,
                            titleImage: UIImageView.init(image: UIImage(named: "photo1")),
                            titleLabel: "Недавние",
                            titleCount: "555")
        ]
                ),
        Sections(
            title: "Заголовок2",
            cells: [
            ModelCellAlbums(type: .cellPeopleAndPlaces,
                            titleImage: UIImageView.init(image: UIImage(named: "photo3")),
                            titleLabel: "Люди",
                            titleCount: "666"),
            ModelCellAlbums(type: .cellPeopleAndPlaces,
                            titleImage: UIImageView.init(image: UIImage(named: "photo8")),
                            titleLabel: "Места",
                            titleCount: "777"),
            ModelCellAlbums(type: .cellPeopleAndPlaces,
                            titleImage: UIImageView.init(image: UIImage(named: "photo6")),
                            titleLabel: "Разное",
                            titleCount: "999")
        ]
                ),
        Sections(
            title: "Заголовок3",
            cells: [
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "video")),
                            titleLabel: "Видео",
                            titleCount: "666"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "person.crop.square")),
                            titleLabel: "Селфи",
                            titleCount: "123"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "livephoto")),
                            titleLabel: "Фото Life Photos",
                            titleCount: "333"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "square.stack.3d.forward.dottedline")),
                            titleLabel: "Портреты",
                            titleCount: "111"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "timelapse")),
                            titleLabel: "Таймлапс",
                            titleCount: "777"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "slowmo")),
                            titleLabel: "Замедление",
                            titleCount: "007"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "square.on.square")),
                            titleLabel: "Серии",
                            titleCount: "999"),
            ModelCellAlbums(type: .cellTypesOfMediafiles,
                            titleImage: UIImageView.init(image: UIImage(systemName: "doc.text.viewfinder")),
                            titleLabel: "Снимки экрана",
                            titleCount: "101")
        ]
                )]

}
