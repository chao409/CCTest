//
//  TextLinkTableViewCell.m
//  HuanLiDemo
//
//  Created by cc on 2019/4/3.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "TextLinkTableViewCell.h"
#import <HLApi/HLView.h>
@implementation TextLinkTableViewCell
{
    HLView *_hlView;
    
}
+ (CGFloat)cellHeight
{
    return 50;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addHlView];
        NSLog(@"----%s",__func__);
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addHlView];
        NSLog(@"%s",__func__);
    }
    return self;
}
- (void)addHlView
{
    _hlView = [HLView viewWithViewType:HLViewTypeTextLink positionCode:@"home_text_link_1" block:nil];
    
    [self addSubview:_hlView];
}

- (void)layoutSubviews
{
    _hlView.frame =  CGRectMake(5, 5, self.contentView.bounds.size.width -10, self.contentView.bounds.size.height -10);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
