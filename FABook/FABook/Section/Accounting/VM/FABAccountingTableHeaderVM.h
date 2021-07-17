//
//  FABAccountingTableHeaderVM.h
//  FABook
//
//  Created by lg on 2021/7/17.
//

#import "FABBaseVM.h"
#import "FABAccountingCollectionCellVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface FABAccountingTableHeaderVM : FABBaseVM

@property (nonatomic, strong) NSMutableArray<FABAccountingCollectionCellVM *> *cellVMs;

@end

NS_ASSUME_NONNULL_END
