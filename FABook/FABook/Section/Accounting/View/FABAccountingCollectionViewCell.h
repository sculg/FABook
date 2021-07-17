//
//  FABAccountingCollectionViewCell.h
//  FABook
//
//  Created by lg on 2021/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FABAccountingCollectionCellVM;

@interface FABAccountingCollectionViewCell : UICollectionViewCell

- (void)setupWithVM:(FABAccountingCollectionCellVM *)VM;

@end

NS_ASSUME_NONNULL_END
