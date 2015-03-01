//
//  PKColors.h
//  Peek
//
//  Created by Izuchukwu Elechi on 7/18/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#ifndef Peek_PKColors_h
#define Peek_PKColors_h

//
//  Peek
//

#define PKColorNorthernCinematicRed [UIColor colorWithRed:0.749 green:0.027 blue:0.071 alpha:1.000] // don't ask
#define PKColorUTDGreen [UIColor colorWithRed:0.357 green:0.663 blue:0.153 alpha:1.000] // orange & green: world's greatest color combo
#define PKColorSuperGray [UIColor colorWithWhite:0.310 alpha:1.0]
#define PKColorWhite [UIColor whiteColor]

#define PKColorFunctionSquare(A) A*A

//
//  Header
//

#define PKAlphaHeaderShadow 0.05

//
//  Post View
//

#define PKAlphaPostViewTitleShadow 0.4
#define PKAlphaPostViewButtonShadow 0.5
#define PKAlphaPostViewPhotoShadow 0.4
#define PKAlphaPostViewShadow 0.125

#define PKAlphaPostViewMetadataDomain 0.7
#define PKAlphaPostViewMetadata PKColorFunctionSquare(PKAlphaPostViewMetadataDomain)

#define PKColorPostViewMetadataDomain [PKColorSuperGray colorWithAlphaComponent:PKAlphaPostViewMetadataDomain]
#define PKColorPostViewMetadata [PKColorSuperGray colorWithAlphaComponent:PKAlphaPostViewMetadata]

#define PKAlphaPostViewMetadataDomainWhite 0.9
#define PKAlphaPostViewMetadataWhite PKColorFunctionSquare(PKAlphaPostViewMetadataDomainWhite)

#define PKColorPostViewMetadataDomainWhite [PKColorWhite colorWithAlphaComponent:PKAlphaPostViewMetadataDomainWhite]
#define PKColorPostViewMetadataWhite [PKColorWhite colorWithAlphaComponent:PKAlphaPostViewMetadataWhite]

#define PKColorSetPostViewMetadataMarkdown @[PKColorPostViewMetadata, PKColorPostViewMetadata]
#define PKColorSetPostViewMetadataWhiteMarkdown @[PKColorPostViewMetadataWhite, PKColorPostViewMetadataWhite]

#define PKColorSetPostViewDomainMarkdown @[PKColorPostViewMetadataDomain, PKColorPostViewMetadataDomain]
#define PKColorSetPostViewDomainWhiteMarkdown @[PKColorPostViewMetadataDomainWhite, PKColorPostViewMetadataDomainWhite]

#define PKColorPostViewMetadataNSFWRed PKColorNorthernCinematicRed
#define PKColorPostViewMetadataNSFWHighContrastRed [UIColor redColor]

#define PKColorPostViewTitle PKColorSuperGray
#define PKColorPostViewTitleFlair [PKColorPostViewTitle colorWithAlphaComponent:0.5]

#define PKColorPostViewTitleWhite PKColorWhite
#define PKColorPostViewTitleFlairWhite [PKColorPostViewTitleWhite colorWithAlphaComponent:0.5]

#define PKColorPostViewKarmaLabel [UIColor colorWithRed:0.557 green:0.573 blue:0.580 alpha:1.000]
#define PKColorPostViewCommentLabel PKColorPostViewKarmaLabel
#define PKColorPostViewPostButton [UIColor colorWithWhite:0.584 alpha:0.08]
#define PKColorPostViewPostButtonSelected [UIColor colorWithWhite:0.584 alpha:0.18]

#define PKColorPostViewKarmaLabelWhite [UIColor colorWithWhite:1.0 alpha:0.9]
#define PKColorPostViewCommentLabelWhite PKColorPostViewKarmaLabelWhite
#define PKColorPostViewPostButtonWhite [UIColor colorWithWhite:0.0 alpha:0.3]
#define PKColorPostViewPostButtonWhiteSelected [UIColor colorWithWhite:0.0 alpha:0.4]

//
//  Markdown
//

#define PKColorMarkdownFontColor PKColorSuperGray
#define PKColorMarkdownLinkColor PKColorNorthernCinematicRed
#define PKColorMarkdownQuoteColor [PKColorSuperGray colorWithAlphaComponent:0.5]

#define PKColorSetMarkdownDefaultColorSet @[PKColorMarkdownFontColor, PKColorMarkdownQuoteColor]

#endif
