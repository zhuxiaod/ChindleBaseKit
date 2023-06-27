//
//  UIScrollView+EndFefreshing.h
//  ZhiChengSchoolProject
//
//  Created by mac on 2020/9/29.
//  Copyright © 2020 com.chindle.talk915. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (EndFefreshing)

//结束刷新
-(void)tes_endRefreshing;

//自动显示 无数据View
-(void)tes_autoShowNodataView;

//刷新优化
-(void)tes_scrollToTopWithCount:(NSInteger)count type:(BOOL)type;

//隐藏footer
-(void)tes_hideRefreshingFooterWithTotalCount:(NSInteger)totalCount arrayCount:(NSInteger)arrayCount;

//显示没有更多了
-(void)tes_showEndRefreshingFooterWithTotalCount:(NSInteger)totalCount arrayCount:(NSInteger)arrayCount;


@end

NS_ASSUME_NONNULL_END
