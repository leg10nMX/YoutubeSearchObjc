//
//  ViewController.m
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
@interface ViewController () <ViewModelDelegate>
@property (strong,nonatomic) ViewModel *model;
@end

@implementation ViewController

- (ViewModel*)model {
  if (_model == nil) {
    _model = [[ViewModel alloc] init];
    _model.delegate = self;
  }
  return _model;
}

- (void)searchResultsDidChange {
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
