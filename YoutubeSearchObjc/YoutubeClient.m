//
//  YoutubeClient.m
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "YoutubeClient.h"
#import "SearchItem.h"

#warning inserta tu propia Key
NSString * const YoutubeClientAPIKey = @"Youtube_API_KEY";
NSString * const YoutubeClientItemsKey = @"items";

@implementation YoutubeClient {
  dispatch_queue_t searchQueue;
}

- (instancetype) init {
  if (self = [super init]) {
    searchQueue = dispatch_queue_create("YoutubeClient.SearchQueue", 0);
  }
  return self;
}
- (void)searchWithQuery:(NSString *)query success:(void (^)(NSArray *))successBlock failure:(void (^)(NSError *))failureBlock {
  dispatch_async(searchQueue, ^{
    NSString *escapedQuery = [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/search?part=snippet&q=%@&type=video&key=%@",escapedQuery,YoutubeClientAPIKey];
    NSError *serviceError = nil;
    NSData *searchData = [self fetchURL:[NSURL URLWithString:urlString] error:&serviceError];
    if (serviceError) {
      failureBlock(serviceError);
      return;
    }
    NSError *jsonError = nil;
    NSDictionary *jsonDictionary = [self parseJSONFromData:searchData error:&jsonError];
    if (jsonError != nil) {
      failureBlock(jsonError);
      return;
    }
    assert([jsonDictionary isKindOfClass:[NSDictionary class]]);
    NSArray *items = jsonDictionary[YoutubeClientItemsKey];
    NSMutableArray *adapterArray = [NSMutableArray array];
    for (NSDictionary *item in items) {
      [adapterArray addObject:[[SearchItem alloc] initWithDictionary:item]];
    }
    successBlock(adapterArray);
  });
}

- (NSData*)fetchURL:(NSURL*)url error:(NSError * __autoreleasing *)error {
  NSData *data = [NSData dataWithContentsOfURL:url options:0 error:error];
  if (*error != nil) {
    return nil;
  }
  return data;
}

- (id)parseJSONFromData:(NSData*)data error:(NSError * __autoreleasing *)error {
  id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
  if (*error!= nil) {
    return nil;
  }
  return jsonObject;
}
@end
