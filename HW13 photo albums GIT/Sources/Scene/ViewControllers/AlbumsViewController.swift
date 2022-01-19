//
//  AlbumsViewController.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class AlbumsViewController: UIViewController {

    private var data = [
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

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(tapOnAddButton))

        setupLayout()
        collectionView.collectionViewLayout = createCompositionalLayout()
    }

    //MARK: - Actions

    @objc func tapOnAddButton() {
        print("Tapped on left plus button")
    }

    // MARK: - Properties

    private lazy var collectionView: UICollectionView = {

        let viewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewFlowLayout)

        collectionView.register(AlbumsViewCell.self,
                                forCellWithReuseIdentifier: "AlbumsViewCell")
        collectionView.register(PeopleAndPlacesViewCell.self,
                                forCellWithReuseIdentifier: "PeopleAndPlacesViewCell")
        collectionView.register(TypesOfMediaFilesCell.self,
                                forCellWithReuseIdentifier: "TypesOfMediaFilesCell")

        collectionView.register(HeadLineAlbumsCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeadLineAlbumsCell")
        collectionView.register(HeadLinePeopleAndPlacesCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeadLinePeopleAndPlacesCell")
        collectionView.register(HeadLineTypesOfMediaCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeadLineTypesOfMediaCell")

        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    //MARK: - Setup Layout

    private func setupLayout() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    //MARK: - Settings Sections

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            switch sectionNumber {
            case 0: return self.layoutSectionCellAlbumsViewCell()
            case 1: return self.layoutSectionCellPeopleAndPlaces()
            case 2: return self.layoutSectionСellTypesOfMedia()
            default:
                return self.layoutSectionCellAlbumsViewCell()
            }
        }
    }

    //MARK: - Create first section

    private func layoutSectionCellAlbumsViewCell() -> NSCollectionLayoutSection {

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92),
                                                heightDimension: .absolute(50))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: "HeadLineAlbumsCell",
            alignment: .top)

        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width * 0.5),
            heightDimension: .absolute(UIScreen.main.bounds.width))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 60,
                                                      trailing: 0)
        group.interItemSpacing = .fixed(60)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }

    //MARK: - Create second section

    private func layoutSectionCellPeopleAndPlaces() -> NSCollectionLayoutSection {

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(50))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeadLinePeopleAndPlacesCell",
            alignment: .top)

        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width * 0.5),
            heightDimension: .absolute(215))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 60,
                                                      trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }

    //MARK: - Create third section

    private func layoutSectionСellTypesOfMedia() -> NSCollectionLayoutSection {

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(view.frame.size.width * 0.1))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeadLineTypesOfMediaCell",
            alignment: .top)

        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width),
            heightDimension: .absolute(35))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 0,
                                                      trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }
}

//MARK: - Extensions UICollectionViewDelegate & UICollectionViewDataSource

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].cells.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let data = data[indexPath.section].cells[indexPath.row]

        switch data.type {
        case .cellMyAlbums:
            return setupAlbumsViewCell(for: indexPath, with: data)
        case .cellPeopleAndPlaces:
            return setupPeopleAndplaces(for: indexPath, with: data)
        case .cellTypesOfMediafiles:
            return setupTypesOfMediaFiles(for: indexPath, with: data)
        }
    }

    private func setupAlbumsViewCell(for indexPath: IndexPath, with data: ModelCellAlbums) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumsViewCell", for: indexPath) as? AlbumsViewCell else { return UICollectionViewCell() }

        cell.titleLabel.text = data.titleLabel
        cell.cellImage = data.titleImage
        cell.labelPhotoCount.text = data.titleCount

        return cell
    }

    private func setupPeopleAndplaces(for indexPath: IndexPath, with data: ModelCellAlbums) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PeopleAndPlacesViewCell", for: indexPath) as? PeopleAndPlacesViewCell else { return UICollectionViewCell() }

        cell.titleLabel.text = data.titleLabel
        cell.cellImage = data.titleImage
        cell.labelPhotoCount.text = data.titleCount

        return cell
    }

    private func setupTypesOfMediaFiles(for indexPath: IndexPath, with data: ModelCellAlbums) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypesOfMediaFilesCell", for: indexPath) as? TypesOfMediaFilesCell else { return UICollectionViewCell() }

        cell.titleLabel.text = data.titleLabel
        cell.cellImage = data.titleImage
        cell.labelPhotoCount.text = data.titleCount
        cell.arrowImageView.image = UIImage(systemName: "chevron.right")

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headLineAlbumsCell =  collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeadLineAlbumsCell",
            for: indexPath) as! HeadLineAlbumsCell

        let headLinePeopleAndPlacesCell =  collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeadLinePeopleAndPlacesCell",
            for: indexPath) as! HeadLinePeopleAndPlacesCell

        let headLineTypesOfMediaCell =  collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeadLineTypesOfMediaCell",
            for: indexPath) as! HeadLineTypesOfMediaCell

        let data = data[indexPath.section].cells[indexPath.row]

        switch data.type {
        case .cellMyAlbums:
            headLineAlbumsCell.configure()
            return headLineAlbumsCell
        case .cellPeopleAndPlaces:
            headLinePeopleAndPlacesCell.configure()
            return headLinePeopleAndPlacesCell
        case .cellTypesOfMediafiles:
            headLineTypesOfMediaCell.configure()
            return headLineTypesOfMediaCell
        }
    }
}
