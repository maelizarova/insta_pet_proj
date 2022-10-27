//
//  HomeFeedCellType.swift
//  Insta
//
//  Created by Мария Елизарова on 27.10.2022.
//

import Foundation

enum HomeFeedCellType {
    case poster(viewModel: PosterCollectionViewCellViewModel)
    case post(viewModel: PostCollectionViewCellViewModel)
    case actions(viewModel: PostActionsCollectionViewCellViewModel)
    case likeCount(viewModel: PostLikesCollectionViewCellViewModel)
    case caption(viewModel: PostCaptionCollectionViewCellViewModel)
    case timestamp(viewModel: PostDatetimeCollectionViewCellViewModel)
}
