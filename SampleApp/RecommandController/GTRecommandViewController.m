//
//  GTRecommandViewController.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/12.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTRecommandViewController.h"
#import "GTRecommendSectionController.h"
#import "GTListLoader.h"
#import "IGListKit.h"

@interface GTRecommandViewController ()<UIScrollViewDelegate,IGListAdapterDataSource>

@property(nonatomic, strong, readwrite) UICollectionView *collectionView;
@property(nonatomic, strong, readwrite) IGListAdapter *listAdapter;
@property(nonatomic, strong, readwrite) GTListLoader *listLoader;
@property(nonatomic, strong, readwrite) NSArray *dataArray;

@end

@implementation GTRecommandViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listLoader = [[GTListLoader alloc] init];
    
    [self.view addSubview:({
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView;
    })];
    
    _listAdapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    
    _listAdapter.dataSource = self;
    _listAdapter.scrollViewDelegate = self;
    _listAdapter.collectionView = _collectionView;
    
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof (wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.listAdapter reloadDataWithCompletion:nil];
    }];

}

#pragma mark -

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSLog(@"-------dataArray-----%@",self.dataArray);
    return @[@"1", @"2", @"3", @"4", @"5"];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [GTRecommendSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - UISCROLLVIEW DELEGATE

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"---scrollViewDidScroll--- %@", @(scrollView.contentOffset.x));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");
}

#pragma mark - SCHEME TEST

- (void)viewClick {

    NSURL *urlScheme = [NSURL URLWithString:@"testScheme://"];

    __unused BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:urlScheme];

    [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success) {
        NSLog(@"");
    }];
}

@end
