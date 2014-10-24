//
//  ViewModel.m
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "ViewModel.h"
#import "YoutubeClient.h"
#import "SearchItem.h"
@interface ViewModel ()
@property (strong,nonatomic)NSArray *items;
@property (strong,nonatomic)YoutubeClient *youtubeClient;
@end

@implementation ViewModel
- (instancetype)init {
  if (self = [super init]) {
    self.youtubeClient = [[YoutubeClient alloc] init];
  }
  return self;
}

- (void)setQuery:(NSString*)query {
  _query = query;
  if ([query length]>0) {
    [self.youtubeClient searchWithQuery:_query success:^(NSArray *results) {
      self.items = results;
      [self.delegate searchResultsDidChange];
    } failure:^(NSError *error) {
      [self.delegate searchDidFailWithError:error];
    }];
  }
}

- (NSInteger)itemCount {
  return [self.items count];
}

- (SearchItem*)itemAtIndex:(NSInteger)index {
  return self.items[index];
}
@end
