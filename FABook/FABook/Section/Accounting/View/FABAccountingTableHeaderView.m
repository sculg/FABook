//
//  FABAccountingTableHeaderView.m
//  FABook
//
//  Created by lg on 2021/7/17.
//

#import "FABAccountingTableHeaderView.h"
#import "FABAccountingTableHeaderVM.h"
#import "FABAccountingCollectionViewCell.h"
#import "FABAccountingCollectionViewLayout.h"

@interface FABAccountingTableHeaderView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) FABAccountingTableHeaderVM *headerVM;

@property (nonatomic, strong) FABAccountingCollectionViewLayout *pageLayout;

@end

@implementation FABAccountingTableHeaderView

#pragma mark - Initialize Methods
#pragma mark - Life Cycle
#pragma mark - Super Methods
#pragma mark - Private Methods
#pragma mark - Public Methods

- (void)setupWithVM:(FABAccountingTableHeaderVM *)VM {
    
}

#pragma mark - Event

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.headerVM.cellVMs.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FABAccountingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FABAccountingCollectionViewCell class]) forIndexPath:indexPath];
    [cell setupWithVM:self.headerVM.cellVMs[indexPath.row]];
    return cell;
}

#pragma mark - Property

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.bounds.size.width, self.bounds.size.height - 100 * 2) collectionViewLayout:self.pageLayout
                           ];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[FABAccountingCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([FABAccountingCollectionViewCell class])];
    }
    return _collectionView;
}

- (FABAccountingCollectionViewLayout *)pageLayout {
    if (!_pageLayout) {
        _pageLayout  = [[FABAccountingCollectionViewLayout alloc] init];
        _pageLayout.minimumInteritemSpacing = 0;
        _pageLayout.minimumLineSpacing = 0;
        _pageLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return  _pageLayout;
}

@end
