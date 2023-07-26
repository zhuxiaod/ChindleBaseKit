//
//  UIScrollView+EndFefreshing.m
//  ZhiChengSchoolProject
//
//  Created by mac on 2020/9/29.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import "UIScrollView+EndFefreshing.h"
#import <MJRefresh/MJRefresh.h>
#import "UIView+Empty.h"
#import "UIScrollView+YYAdd.h"

@implementation UIScrollView (EndFefreshing)

-(void)tes_hideRefreshingFooterWithTotalCount:(NSInteger)totalCount arrayCount:(NSInteger)arrayCount{
    
    [self.mj_footer endRefreshing];
    
    [self.mj_header endRefreshing];
    
    self.mj_footer.hidden = NO;
    
    if(totalCount <= arrayCount) {
        self.mj_footer.hidden = YES;
    }
}

-(void)tes_showEndRefreshingFooterWithTotalCount:(NSInteger)totalCount arrayCount:(NSInteger)arrayCount{
    
    [self.mj_footer endRefreshing];
    
    [self.mj_header endRefreshing];

    self.mj_footer.hidden = NO;
    if(totalCount <= arrayCount) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
}

-(void)tes_endRefreshing{
    [self ly_endLoading];
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

-(void)tes_autoShowNodataView{
//    self.ly_emptyView = [TESCommonTools nodataView];//未配置
}

//刷新优化
-(void)tes_scrollToTopWithCount:(NSInteger)count type:(BOOL)type{
    if(type == YES && count > 0){
        [self scrollToTopAnimated:NO];
    }
}

@end
