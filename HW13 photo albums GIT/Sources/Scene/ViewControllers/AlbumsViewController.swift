//
//  AlbumsViewController.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class AlbumsViewController: UIViewController {

    let data = Sections.data
    
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
