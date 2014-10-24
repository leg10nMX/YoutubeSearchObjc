//
//  ViewModel.h
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchItem.h"
@protocol ViewModelDelegate <NSObject>
- (void)searchResultsDidChange;
- (void)searchDidFailWithError:(NSError*)error;
@end

@interface ViewModel : NSObject
@property (weak,nonatomic)id<ViewModelDelegate> delegate;
@end
