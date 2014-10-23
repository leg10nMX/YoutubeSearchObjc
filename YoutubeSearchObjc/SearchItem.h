//
//  SearchItem.h
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchItem : NSObject
@property (nonatomic,readonly) NSString *videoId;
@property (nonatomic,readonly) NSString *publishedAt;
@property (nonatomic,readonly) NSString *title;
@property (nonatomic,readonly) NSString *videoDescription;
@property (nonatomic,readonly) NSString *defaultThumbnail;
@property (nonatomic,readonly) NSString *mediumThumbnail;
@property (nonatomic,readonly) NSString *highThumbnail;
@property (nonatomic,readonly) NSString *channelTitle;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
@end
