//
//  SearchItem.m
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "SearchItem.h"

NSString * const kVideoId = @"videoId";
NSString * const kPublishedAt = @"publishedAt";
NSString * const kTitle = @"title";
NSString * const kVideoDescription = @"description";
NSString * const kThumbnails = @"thumbnails";
NSString * const kChannelTitle = @"channelTitle";
NSString * const kId = @"id";
NSString * const kSnippet = @"snippet";

NSString * const kDefaultThumbnail = @"default";
NSString * const kMediumThumbnail = @"medium";
NSString * const kHighThumbnail = @"high";
NSString * const kURL = @"url";

@interface SearchItem ()
@property (strong,nonatomic) NSDictionary *dictionary;
@end

@implementation SearchItem
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.dictionary = dictionary;
  }
  return self;
}

- (NSDictionary*)snippet {
  return self.dictionary[kSnippet];
}
- (NSDictionary*)_id {
  return self.dictionary[kId];
}
- (NSDictionary*)thumbnails {
  return [self snippet][kThumbnails];
}

- (NSString*)videoId {
  return [self _id][kVideoId];
}

- (NSString*)publishedAt {
  return [self snippet][kPublishedAt];
}

- (NSString*)title {
  return [self snippet][kTitle];
}

- (NSString*)videoDescription {
  return [self snippet][kVideoDescription];
}

- (NSString*)channelTitle {
  return [self snippet][kChannelTitle];
}

- (NSString*)defaultThumbnail {
  return [self thumbnails][kDefaultThumbnail];
}

- (NSString*)mediumThumbnail {
  return [self thumbnails][kMediumThumbnail];
}

- (NSString*)highThumbnail {
  return [self thumbnails][kHighThumbnail];
}
@end
