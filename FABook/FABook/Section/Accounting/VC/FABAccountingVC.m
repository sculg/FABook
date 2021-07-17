//
//  FABAccountingVC.m
//  FABook
//
//  Created by lg on 2021/7/16.
//

#import "FABAccountingVC.h"
#import "FABAccountingTableHeaderView.h"

@interface FABAccountingVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) FABAccountingTableHeaderView *tableHeaderView;

@end

@implementation FABAccountingVC

#pragma mark - Initialize Methods
#pragma mark - Life Cycle

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    [super viewDidLoad];
}

#pragma mark - Super Methods
#pragma mark - Private Methods
#pragma mark - Public Methods
#pragma mark - Event
#pragma mark - <<#Delegate#>>
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Property

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 44;
        
    }
    return _tableView;
}

@end
