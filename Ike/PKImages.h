//
//  PKImages.h
//  Peek
//
//  Created by Izuchukwu Elechi on 7/19/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#ifndef Peek_PKImages_h
#define Peek_PKImages_h

//
//  Peek
//

#define PKImage(A) [UIImage imageNamed:A]
#define PKImageSymmetricalCapInset(A) UIEdgeInsetsMake(A, A, A, A)

//
//  Post View
//

#define PKImagePostViewUpvote PKImage(@"post-button-upvote-unselected")
#define PKImagePostViewDownvote PKImage(@"post-button-downvote-unselected")

#define PKImagePostViewUpvoteHighlighted PKImage(@"post-button-upvote-highlighted")
#define PKImagePostViewDownvoteHighlighted PKImage(@"post-button-downvote-highlighted")

#define PKImagePostViewUpvoteSelected PKImage(@"post-button-upvote-selected")
#define PKImagePostViewDownvoteSelected PKImage(@"post-button-downvote-selected")

#define PKImagePostViewUpvoteWhite PKImage(@"post-button-white-upvote-unselected")
#define PKImagePostViewDownvoteWhite PKImage(@"post-button-white-downvote-unselected")

#define PKImagePostViewUpvoteWhiteSelected PKImage(@"post-button-white-upvote-selected")
#define PKImagePostViewDownvoteWhiteSelected PKImage(@"post-button-white-downvote-selected")

#define PKImagePostViewReply PKImage(@"post-button-reply-unselected")
#define PKImagePostViewReplySelected PKImage(@"post-button-reply-selected")

#define PKImagePostViewReplyWhite PKImage(@"post-button-white-reply-unselected")
#define PKImagePostViewReplyWhiteSelected PKImage(@"post-button-white-reply-selected")

#define PKImagePostViewIconScore PKImage(@"post-icon-score")
#define PKImagePostViewIconCommentCount PKImage(@"post-icon-comments")

#define PKImagePostViewIconScoreWhite PKImage(@"post-icon-white-score")
#define PKImagePostViewIconCommentCountWhite PKImage(@"post-icon-white-comments")

#define PKImagePostViewIconPlay PKImage(@"post-icon-play")

#define PKImagePostViewMaskCell PKImage(@"post-mask-cell")
#define PKImagePostViewMaskCellCapInsets PKImageSymmetricalCapInset(12.0)
#define PKImagePostViewMaskCellRealInsets UIEdgeInsetsMake(0, 6.5, 4.0, 6.5)

#define PKImagePostViewMaskThumb PKImage(@"post-mask-thumb")

#define PKImagePostViewMaskPhoto PKImage(@"post-mask-photo")
#define PKImagePostViewMaskPhotoCapInsets UIEdgeInsetsMake(0.5, 5.0, 2.5, 5.0)

//
//  Photo Viewer
//

#define PKImagePhotoViewerShare PKImage(@"photo-action-share")

#endif
