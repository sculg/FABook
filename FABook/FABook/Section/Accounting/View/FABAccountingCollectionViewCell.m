//
//  FABAccountingCollectionViewCell.m
//  FABook
//
//  Created by lg on 2021/7/17.
//

#import "FABAccountingCollectionViewCell.h"
#import "FABAccountingCollectionCellVM.h"

@interface FABAccountingCollectionViewCell ()

@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;

@end

@implementation FABAccountingCollectionViewCell

#pragma mark - Initialize Methods

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        [self setupContaints];
    }
    return self;
}
#pragma mark - Life Cycle
#pragma mark - Super Methods
#pragma mark - Private Methods

- (void)setupSubViews {
    [self addSubview:self.colorView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.valueLabel];
}

- (void)setupContaints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(36.0f);
        make.top.equalTo(self);
    }];
    
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12.0f);
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(16.0f, 16.0f));
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(2.0f);
        make.left.equalTo(self.titleLabel);
        make.width.equalTo(@(kScreenWidth*0.30));
    }];
}

#pragma mark - Public Methods
#pragma mark - Event
#pragma mark - <<#Delegate#>>
#pragma mark - Property

- (void)setupWithVM:(FABAccountingCollectionCellVM *)VM {
    
}

- (UIView *)colorView{
    if (!_colorView) {
        _colorView = [[UIView alloc] init];
        _colorView.layer.cornerRadius = 8;
        _colorView.layer.masksToBounds = YES;

    }
    return _colorView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kFontSize(14);
        _titleLabel.textColor = UIColorFromRGB(0x222222);
    }
    return _titleLabel;
}
- (UILabel *)valueLabel{
    if (!_valueLabel) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.textColor = UIColorFromRGB(0x222222);
        _valueLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _valueLabel;
}

@end
