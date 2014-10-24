//
//  ViewController.m
//  YoutubeSearchObjc
//
//  Created by Emanuel Peña Aguilar on 15/10/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "SearchItem.h"
@interface ViewController () <ViewModelDelegate,UISearchBarDelegate>
@property (strong,nonatomic) ViewModel *model;
@end

NSString * const UITableViewCellReuseIdentifier = @"ViewController.Cell";

@implementation ViewController

- (ViewModel*)model {
  if (_model == nil) {
    _model = [[ViewModel alloc] init];
    _model.delegate = self;
  }
  return _model;
}

- (void)searchResultsDidChange {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
  });
}

- (void)searchDidFailWithError:(NSError *)error {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.description preferredStyle:UIAlertControllerStyleAlert];
  [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
  [self presentViewController:alert animated:YES completion:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  self.model.query = searchBar.text;
  [searchBar resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.model itemCount];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellReuseIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:UITableViewCellReuseIdentifier];
  }
  SearchItem *item = [self.model itemAtIndex:[indexPath row]];
  cell.textLabel.text = item.title;
  cell.detailTextLabel.text = item.videoDescription;
  return cell;
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
