//
//  PKFonts.h
//  Peek
//
//  Created by Izuchukwu Elechi on 7/18/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#ifndef Peek_PKFonts_h
#define Peek_PKFonts_h

#define PS(A) A/2.0 // Let's me put in the font sizes straight from Photoshop
#define PKFont(A,B) [UIFont fontWithName:A size:B]

//
//  Header
//

#define PKFontHeaderTitle [UIFont fontWithName:@"HelveticaNeue-Medium" size:PS(25.0)]
#define PKFontHeaderSubtitle [UIFont fontWithName:@"HelveticaNeue" size:PS(24.0)]
#define PKFontHeaderSearch [UIFont fontWithName:@"HelveticaNeue-Light" size:PS(40.0)]
#define PKFontHeaderButton [UIFont fontWithName:@"HelveticaNeue" size:PS(24.0)]

//
//  Post View
//

#define PKFontPostViewMetadataDomain [UIFont fontWithName:@"HelveticaNeue-Medium" size:11]
#define PKFontPostViewMetadata [UIFont fontWithName:@"HelveticaNeue" size:11]
#define PKFontPostViewMetadataName @"HelveticaNeue"
#define PKFontPostViewMetadataDomainName @"HelveticaNeue-Medium"
#define PKFontPostViewMetadataSize 11
#define PKFontPostViewMetadataDomainSize PKFontPostViewMetadataSize

#define PKFontSetPostViewMetadataMarkdown @[PKFontPostViewMetadataName, PKFontPostViewMetadataName, PKFontPostViewMetadataName, PKFontPostViewMetadataName, PKFontPostViewMetadataName, PKFontPostViewMetadataName, PKFontPostViewMetadataName]

#define PKFontSetPostViewMetadataDomainMarkdown @[PKFontPostViewMetadataDomainName, PKFontPostViewMetadataDomainName, PKFontPostViewMetadataDomainName, PKFontPostViewMetadataDomainName, PKFontPostViewMetadataDomainName, PKFontPostViewMetadataDomainName, PKFontPostViewMetadataDomainName]

#define PKFontSizeSetPostViewMetadataMarkdown @[@(PKFontPostViewMetadataSize), @(PKFontPostViewMetadataSize), @(PKFontPostViewMetadataSize)]

#define PKFontSizeSetPostViewMetadataDomainMarkdown PKFontSizeSetPostViewMetadataMarkdown

#define PKFontPostViewTitle [UIFont fontWithName:@"HelveticaNeue" size:14]
#define PKFontPostViewTitleFlair [UIFont fontWithName:@"HelveticaNeue" size:11.25]

#define PKFontPostViewAnnotationTitle [UIFont fontWithName:@"HelveticaNeue-Medium" size:14]
#define PKFontPostViewAnnotationCaption [UIFont fontWithName:@"HelveticaNeue" size:14]

//
//  Photo Viewer
//

#define PKFontPhotoViewerAlbumIndicator [UIFont fontWithName:@"HelveticaNeue-Bold" size:12]
#define PKFontPhotoViewerAlbumIndicatorDivider [UIFont fontWithName:@"HelveticaNeue" size:12]

//
//  Overlays
//

#define PKFontOverlayDescriptionLabel [UIFont fontWithName:@"HelveticaNeue" size:15]

//
//  Markdown View
//

#define PKFontNameMarkdownStandard @"HelveticaNeue"
#define PKFontNameMarkdownMedium @"HelveticaNeue-Medium"
#define PKFontNameMarkdownBold @"HelveticaNeue-Bold"
#define PKFontNameMarkdownItalic @"HelveticaNeue-Italic"
#define PKFontNameMarkdownBoldItalic @"HelveticaNeue-BoldItalic"
#define PKFontNameMarkdownMonospace @"Menlo-Regular"
#define PKFontNameMarkdownHeader PKFontNameMarkdownMedium

#define PKFontSetMarkdownDefaultFontSet @[PKFontNameMarkdownStandard, PKFontNameMarkdownMedium, PKFontNameMarkdownBold, PKFontNameMarkdownItalic, PKFontNameMarkdownBoldItalic, PKFontNameMarkdownMonospace, PKFontNameMarkdownHeader]

#define PKFontSizeMarkdownStandard 12.5
#define PKFontSizeMarkdownStandardHeader 14.0
#define PKFontSizeMarkdownStandardCode 11.5

#define PKFontSizeMarkdownTable 12.0
#define PKFontSizeMarkdownTableHeader 13.0
#define PKFontSizeMarkdownTableCode 11.0

#define PKFontSizeSetMarkdownDefaultFontSizeSet @[@(PKFontSizeMarkdownStandard), @(PKFontSizeMarkdownStandardHeader), @(PKFontSizeMarkdownStandardCode)]
#define PKFontSizeSetMarkdownTableFontSizeSet @[@(PKFontSizeMarkdownTable), @(PKFontSizeMarkdownTableHeader), @(PKFontSizeMarkdownTableCode)]

#endif
