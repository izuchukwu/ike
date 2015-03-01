//
//  PKStrings.h
//  Peek
//
//  Created by Izuchukwu Elechi on 7/18/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#ifndef Peek_PKStrings_h
#define Peek_PKStrings_h

//
//  Photo Viewer
//

#define PKStringPhotoViewerAlbumLabelFormat @"%d of %d"
#define PKStringPhotoViewerAlbumLabelNumber1Range NSMakeRange(0, [[[NSNumber numberWithInt:num1] stringValue] length])
#define PKStringPhotoViewerAlbumLabelNumber2Range NSMakeRange([[[NSNumber numberWithInt:num1] stringValue] length] + [@" of " length], [[[NSNumber numberWithInt:num2] stringValue] length])
#define PKStringPhotoViewerAlbumLabelTextRange NSMakeRange([[[NSNumber numberWithInt:num1] stringValue] length], [@" of " length])

#define PKStringPhotoViewerCopyLinkActivityTitle @"Copy Link to Image"

#endif
