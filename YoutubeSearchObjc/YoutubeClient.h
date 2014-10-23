//
//  YoutubeClient.h
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoutubeClient : NSObject
- (void)searchWithQuery:(NSString*)query success:(void (^)(NSArray* results))successBlock failure:(void (^)(NSError *error))failureBlock;
@end
